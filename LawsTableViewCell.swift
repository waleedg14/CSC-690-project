
import UIKit

class LawsTableViewCell: UITableViewCell {

    @IBOutlet weak var lawView: UIView!
    @IBOutlet weak var lawImage: UIImageView!
    @IBOutlet weak var lawTitle: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ name: String, _ image: String){
        lawTitle.text = name
        lawImage.image = UIImage(named: image)
        print (name, image)
    }

}
