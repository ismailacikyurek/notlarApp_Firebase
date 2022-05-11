//
//  NotEkleVC.swift
//  notUygulamasi
//
//  Created by İSMAİL AÇIKYÜREK on 5.05.2022.
//

import UIKit
import Firebase
var ref : DatabaseReference!
class NotEkleVC: UIViewController {
    
    @IBOutlet weak var txtDersAdi: UITextField!
    
    @IBOutlet weak var txtNot1: UITextField!
    
    @IBOutlet weak var txtNot2: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    

    @IBAction func btnEKle(_ sender: Any) {
        if let ad = txtDersAdi.text,let not1 = txtNot1.text,let not2 = txtNot2.text {
            if let n1 = Int(not1),let n2 = Int(not2) {
                notEkle(ders_adi: ad, not1: n1, not2: n2)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    func notEkle(ders_adi : String, not1 : Int,not2 :Int) {
        let dict : [String:Any] = ["ders_adi" : ders_adi,"not1" : not1,"not2" : not2]
        let newRef = ref.child("notlar").childByAutoId()
        newRef.setValue(dict)
        
        
    }
    

}
