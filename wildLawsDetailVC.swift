//
//  wildLawsDetailVC.swift
//  Wildify
//
//  Created by Victor Callejas on 4/22/21.
//
//

import UIKit

class wildLawsDetailVC: UIViewController {

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleDescription: UILabel!
    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var source: UILabel!
    
    var detailIm = ""
    var titlestr = ""
    var src = ""
    var desc = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
       // mView.roundCornersa(corners: [.topRight, .topLeft], radius: 70.0)
        self.mView.roundCorners(corners: [.topLeft, .topRight], radius: 60.0)
        crossBtn.addTarget(self, action: #selector(pop(sender:)), for: .touchUpInside)
        detailImg.image = UIImage(named: detailIm)
        titleLbl.text = titlestr
        source.text = "Photo:" + src
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
