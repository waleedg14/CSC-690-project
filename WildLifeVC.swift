//
//  WildLifeVC.swift
//  Wildify
//
//  Created by Waleed Ghaleb on 4/04/2021.
//

import UIKit

class WildLifeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var superV: UIView!
    
    ///second col view
    var lawTitles = [
        "Killing and destroying wildlife species are illegal.",
        "Inflicting injury that cripples and/or impairs the reproductive system of wildlife species is illegal.",
        "Damaging critical habitats of wildlife is illegal.",
        "Introducing, reintroducing, or restocking wildlife without authorization is illegal.",
        "Trading of wildlife species, by-products, and derivatives is illegal.",
        "Collecting, hunting, or possessing wildlife species, by-products, and derivatives without the necessary permits is illegal.",
        "Gathering or destroying active nests, nest trees, host plants, and the like, which affect wildlife, is illegal.",
        "Maltreating or inflicting injury to wildlife is illegal.",
        "Transporting wildlife without the necessary permit is illegal."]
    var lawImages = ["law-image-1","law-image-2","law-image-3","law-image-4","law-image-5","law-image-6","law-image-7","law-image-8","law-image-9",]
    var lawDescriptions = ["Exceptions are made in the following instances: \nwhen it is done as part of religous rituals of indigenous communities \nwhen the wildlife is sick with an incurable infectious disease \nwhen it is considered necessary to end the misery  afflicted wildlife \nwhen it is done to prevent imminent danger to human beings \nwhen the wildlife is killed or destroyed after it has been used in authorized research or experiments. \nFines and Penalties: Imprisonment from 6 months and 1 day up to 12 years, and/or fines from ₱10,000 to ₱1,000,000, depending on the conservation status of the wildlife species","Fines and Penalties: Imprisonment from 1 month up to 6 years, and/or fines from ₱5,000 to ₱500,000, depending on the conservation status of the wildlife species","These activities include dumping of waste products harmful to wildlife, squatting or occupying any portion of the critical habitat, extracting minerals, burning, logging, and quarrying. \nFines and Penalties: Imprisonment from 1 month up to 8 years, and/or fines from ₱5,000 to ₱5,000,000","Introducing species into the wild outside of its natural habitat, re-establishing species in the wild where it used to live but is now extinct, or replenishing species populations in the wild with additional individuals may only be allowed for purposes of population enhancement or recovery. There must be a permit issued by proper authorities following scientific studies and public consultation. \nNo exotic species shall be introduced to the country, especially in protected areas and critical habitats, without a permit from the proper authorities, subjected to environmental impact study, and granted consent by stakeholders. \n Fines and Penalties: Imprisonment from 1 month up to 8 years, and/or fines from ₱5,000 to ₱5,000,000","This includes selling, exporting, and importing without the necessary permits. \nWildlife species may only be exported to or imported from another country with proper authorization and under strict compliance with the law. The recipient of the wildlife must also be technically and financially capable to maintain it. \nBy-products and derivatives include parts and substances extracted from wildlife species, in raw or in processed form. \nFines and Penalties: Imprisonment from 10 days to 4 years, and/or fines from ₱200 to ₱300,000, depending on the conservation status of the wildlife species ","Collecting wildlife species, by-products, and derivatives may only be allowed in the following instances: \nwhen appropriate and acceptable collection techniques with little or no harmful effects to wildlife and their habitats are used \nfor traditional use of indigenous peoples and not primarily for trade, excluding threatened species \nfor scientific research purposes, with proper clearance and permit from authorities. \nPossessing wildlife species, by-products, and derivatives may only be allowed if the person or entity can prove financial and technical capability and the facility to do so, and if the wildlife was obtained without violating the law. \nBy-products and derivatives include parts and substances extracted from wildlife species, in raw or in processed form. \nFines and Penalties: Imprisonment from 10 days to 4 years, and/or fines from ₱1,000 to ₱300,000, depending on the consevation status of the wildlife species. Maximum penalty will be imposed if the act was committed through inappropriate methods and tools.","Fines and Penalties: Imprisonment from 10 days to 4 years, and/or fines from ₱1,000 to ₱300,000, depending on the conservation status of the affected wildlife species","Fines and Penalties: Imprisonment from 5 days to 1 year, and/or fines from ₱200 to ₱100,000, depending on the conservation status of the wildlife species","Local transport of wildlife species, by-products, and derivatives may only be authorized if it has the necessary permits and it is not harmful to the wildlife and public health. \nFines and Penalties: Imprisonment from 5 days to 1 year, and/or fines from ₱200 to ₱100,000, depending on the category of the wildlife species"]
    
    var lawSource = ["https://www.bworldonline.com/denr-calls-on-police-to-probe-deeper-into-illegal-animal-trade/",
                     "https://www.bworldonline.com/denr-mulls-forming-task-force-enforce-wildlife-protection-laws/",
                     "https://unsplash.com/photos/UgONGONhhls",
                     "https://www.scubadivermag.com/philippine-police-1500-turtles-luggage/",
                     "https://www.gmanetwork.com/news/news/nation/365630/authorities-rescue-endangered-wildlife-from-traders-in-manila-palawan/story/",
                     "https://www.sunstar.com.ph/article/1819808/Pampanga/Local-News/DENR-wants-Subic-Clark-freeports-monitored-vs-wildlife-trade",
                     "https://unsplash.com/photos/xvrZV7LBK_s",
                     "https://www.traffic.org/news/philippine-bird-trade-targets-indonesian-species/",
                     "http://wakkori93.blogspot.com/2013/04/the-illegal-parrot-trade.html",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.superV.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 60.0)
        tableView.reloadData()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }

}
//MARK:- Table View Stubs
extension WildLifeVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lawTitles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wildLawTableCell", for: indexPath) as! wildLawTableCell
        let imgName = lawImages[indexPath.row] ?? ""
        cell.libImg.image = UIImage(named: imgName)
        cell.titleLbl.text = lawTitles[indexPath.row] ?? ""
        //cell.descriptionLbl.text = lawDescriptions[indexPath.row] ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let img = lawImages[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "wildLawsDetailVC") as! wildLawsDetailVC
        vc.detailIm = img
        vc.desc = lawDescriptions[indexPath.row]
        vc.titlestr =  lawTitles[indexPath.row]
        vc.src = lawSource[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

