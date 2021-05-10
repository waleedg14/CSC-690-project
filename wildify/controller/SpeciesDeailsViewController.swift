//
//  SpeciesDetailVC.swift
//  Wildify
//
//  Created by Waleed Ghaleb on 04/05/2021.
//

import UIKit

class SpeciesDetailVC: UIViewController {

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var centerLbl: UILabel!
    @IBOutlet weak var titleDescription: UILabel!
    @IBOutlet weak var crossBtn: UIButton!
    
    var detailIm = ""
    var titlestr = ""
    var center = ""
    var desc = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // mView.roundCornersa(corners: [.topRight, .topLeft], radius: 40.0)
        self.mView.roundCorners(corners: [.topLeft, .topRight], radius: 60.0)
        crossBtn.addTarget(self, action: #selector(pop(sender:)), for: .touchUpInside)
        detailImg.image = UIImage(named: detailIm)
        titleLbl.text = titlestr
        centerLbl.text = center
        titleDescription.text = desc
        
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    

    @objc func pop(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
   

}
