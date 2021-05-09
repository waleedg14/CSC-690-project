

import UIKit

class SpecieDetailsViewController: UIViewController {

    @IBOutlet weak var specieImage: UIImageView!
    @IBOutlet weak var specieLabel: UILabel!
    
    @IBOutlet weak var specieDetails: UITextView!
    @IBOutlet weak var specieDescription: UILabel!
    
    var selectedSpecieName = ""
    var selectedSpecieImage = ""
    var selectedSpecieDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        specieImage.image = UIImage(named: selectedSpecieImage)
        specieLabel.text = selectedSpecieName
        specieDetails.text = selectedSpecieDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
