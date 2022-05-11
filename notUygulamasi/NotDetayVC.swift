//
//  NotDetayVC.swift
//  notUygulamasi
//
//  Created by İSMAİL AÇIKYÜREK on 5.05.2022.
//

import UIKit
import Firebase

class NotDetayVC: UIViewController {
    @IBOutlet weak var txtDersAdi: UITextField!
    
    @IBOutlet weak var txtNot1: UITextField!
    @IBOutlet weak var txtNOt2: UITextField!
    
    
    var not : Notlar?
    var ref : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        if let n = not {
            txtDersAdi.text = n.ders_ad
            txtNot1.text = String(n.not1!)
            txtNOt2.text = String(n.not2!)
        }
       
     
    }
    
    @IBAction func btnSil(_ sender: Any) {
        if let nid = not?.not_id {
            notSil(not_id: nid)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnGuncelle(_ sender: Any) {
        if let nid = not?.not_id, let ad = txtDersAdi.text,let not1 = txtNot1.text,let not2 = txtNOt2.text {
            if let n1 = Int(not1),let n2 = Int(not2) {
                notGuncelle(not_id: nid, ders_adi: ad, not1: n1, not2: n2)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    func notSil(not_id : String) {
        ref.child("notlar").child(not_id).removeValue()
    }
    
    func notGuncelle(not_id : String,ders_adi : String, not1 : Int,not2 : Int) {
        ref.child("notlar").child(not_id).updateChildValues(["ders_adi" : ders_adi,"not1":not1,"not2":not2])
    }
}
