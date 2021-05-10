//
//  SpeciesLibTabCell.swift
//  Wildify
//
//  Created by Waleed Ghaleb on 21/01/2021.
//

import UIKit
import Foundation

class SpeciesLibTabCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var libImg: UIImageView!
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var lblView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblView.shadowView()
        lblView.roundCornersa(corners: [.topRight, .bottomRight], radius: 12.0)
       
        imgView.layer.cornerRadius = 10
        imgView.layer.masksToBounds = true
        
        libImg.layer.cornerRadius = 6
        libImg.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

