//
//  ViewController.swift
//  notUygulamasi
//
//  Created by İSMAİL AÇIKYÜREK on 5.05.2022.
//

import UIKit
import Firebase
let refreshControl: UIRefreshControl = UIRefreshControl()
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var notlarListe = [Notlar]()
    var ref : DatabaseReference!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
     
        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference()
        
        //refresh
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.backgroundColor = .yellow
        refreshControl.tintColor = .blue
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
    
    
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tumNotlariAL()
    }
   
   


    @objc func refresh(_ sender: AnyObject) {
        tumNotlariAL()
        tableView.reloadData()
        refreshControl.endRefreshing()
        
    }
    
    


   
    func tumNotlariAL() {
        ref.child("notlar").observe(.value) { snapshot in
            if let gelenVeriButunu = snapshot.value as? [String:Any] {
                self.notlarListe .removeAll() //her değişkenlik olduğunda siler
                for gelenSatirVerisi in gelenVeriButunu {
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        let key = gelenSatirVerisi.key
                        let ders_adi = sozluk["ders_adi"] as? String ?? ""
                        let not1 = sozluk["not1"] as? Int ?? 0
                        let not2 = sozluk["not2"] as? Int ?? 0
                        
                        let not = Notlar(not_id: key, ders_ad: ders_adi, not1: not1, not2: not2)
                        self.notlarListe.append(not)
                    }
                }
               
            } else {
                self.notlarListe = [Notlar]()
            }
            DispatchQueue.main.async {
               var toplam = 0
                for i in self.notlarListe {
                    toplam = toplam + (i.not1! + i.not2!)/2
                    if self.notlarListe.count != 0 {
                        self.navigationItem.prompt = "ORTALAMA :\(toplam/self.notlarListe.count)"
                    } else {
                        self.navigationItem.prompt = "ORTALAMA : YOK"
                    }
                    
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let indeks = sender as? Int
             let gidilecekVC = segue.destination as! NotDetayVC
                gidilecekVC.not = notlarListe[indeks!]
            
        }
    }

    @IBAction func btnEkle(_ sender: Any) {
    }
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        notlarListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notlarListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucreCell", for: indexPath) as! NotHucretableViewCell
        cell.lblDers.text = not.ders_ad
        cell.lblNot1.text = String(not.not1!)
        cell.lblNot2.text = String(not.not2!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
    
}

