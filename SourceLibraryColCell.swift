//
//  SourceLibraryColCell.swift
//  Wildify
//
//  Created by Waleed Ghaleb on 4/09/2021.
//

import UIKit

class SourceLibraryColCell: UICollectionViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.shadowView()
    }
}
    
