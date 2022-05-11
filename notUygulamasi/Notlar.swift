//
//  Notlar.swift
//  notUygulamasi
//
//  Created by İSMAİL AÇIKYÜREK on 5.05.2022.
//

import Foundation

class Notlar {
    var not_id : String?
    var ders_ad : String?
    var not1 : Int?
    var not2 :Int?
    
    
    init() {
        
    }
    
    
    init(not_id : String?,ders_ad : String,not1 : Int,not2 :Int) {
        
        self.not_id = not_id
        self.ders_ad = ders_ad
        self.not1 = not1
        self.not2 = not2
        
    }
    
    
}
