//
//  NotHucretableViewCell.swift
//  notUygulamasi
//
//  Created by İSMAİL AÇIKYÜREK on 5.05.2022.
//

import UIKit

class NotHucretableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblDers: UILabel!
    @IBOutlet weak var lblNot1: UILabel!
    
    @IBOutlet weak var lblNot2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
