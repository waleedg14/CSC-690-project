//
//  wildLawTableCell.swift
//  Wildify
//
//  Created by  Victor Callejas on 4/18/21.
//  
//

import UIKit

class wildLawTableCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var libImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.shadowView()
        
        cardView.layer.cornerRadius = 12
        cardView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
