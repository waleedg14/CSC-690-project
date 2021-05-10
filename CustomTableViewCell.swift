
import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var specieImg: UIImageView!
    @IBOutlet weak var specieName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.specieImg.layer.cornerRadius = specieImg.frame.size.width / 2
        specieImg.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ name: String, _ image: String){
        specieName.text = name
        specieImg.image = UIImage(named: image)
        print (name, image)
    }
    
}
