import UIKit
import CoreML
import Vision

class TestViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let imagePicker = UIImagePickerController()
 
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scientificName: UILabel!
    @IBOutlet weak var specieDesc: UILabel!
    @IBOutlet weak var notice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.frame = CGRect(x: self.tableView.frame.origin.x, y: self.tableView.frame.origin.y, width: self.tableView.frame.size.width, height: self.view.frame.size.height - self.tableView.frame.origin.y)
//
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        self.tableView.tableFooterView = UIView()
                                      
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        //imagePicker.sourceType = .camera
        //imagePicker.sourceType = .photoLibrary
        
        if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
            self.imagePicker.sourceType = .camera
            // Make sure ViewController is notified when the user picks an image.
            //self.present(self.imagePicker, animated: true, completion: nil)
        }else {
            imagePicker.sourceType = .photoLibrary
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[.originalImage] as? UIImage {
        
            guard let convertedCIImage = CIImage(image: userPickedImage) else {
                fatalError("Cannot convert to CIImage")
            }
            
        detect(image: convertedCIImage)
        
        imageView.image = userPickedImage
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
     
    func detect(image: CIImage){
        guard let model = try? VNCoreMLModel(for: wildifyClassifier().model) else {
            fatalError("cannot import model")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("Could not classify")
            }
             
            self.navigationItem.title = classification.identifier
            self.requestInfo(animalName: classification.identifier)
        }
        let handler = VNImageRequestHandler(ciImage: image)
        do{
        try handler.perform([request])
        }
        catch {
            print(error)
        }
        
    }
    

    
    func requestInfo(animalName: String){
        let notice = "It is illegal to capture, sell, or possess wildlife and souvenirs made from their parts. Be a protector of Philippine Wildlife."
        switch animalName {
        case "Tamaraw":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "is a small hoofed mammal belonging to the family Bovidae. It is endemic to the island of Mindoro in the Philippines, and is the only endemic Philippine bovine. The tamaraw was originally found all over Mindoro, from sea level up to the mountains (2000 m above sea level), but because of human habitation, hunting, and logging, it is now restricted to only a few remote grassy plains and is now a critically endangered species."
            self.scientificName.text = "Bubalus mindorensis"
            self.notice.text = notice
        case "Dugong":
            self.status.text = "Vulnerable"
            self.specieDesc.text = "A marine mammal that has been recorded in the shallow coasts and mangrove channels throughout the Philippines. The body, flippers and tail flukes look similar to that of a dolphin except that it lacks a dorsal fin. The body is grey but appears brown when observed at sea. The head is distinctive, with the mouth opening downward below a flat broad muzzle. Adult males and some old females have tusks. They are the only marine mammals that are completely herbivorous. They have been heavily exploited in the Philippines, almost to extinction. Populations have drastically declined in much of its global range, facing a high risk of extinction in the wild."
            self.scientificName.text = "Dugong dugon"
            self.notice.text = notice
        case "Amethyst Brown Dove":
            self.status.text = "Least Concern"
            self.specieDesc.text = "It is endemic to the Philippines. It occurs on most large islands except Palawan but is generally rather scarce on Luzon and Mindanao and even rarer elsewhere. Its natural habitats are subtropical or tropical moist lowland forests and subtropical or tropical moist montane forests. It is found in lowlands but probably prefers middle and high elevations at 500-2000m. It is most often seen singly or in pairs, in and around fruiting trees. The call is a deep, sonorous 'hoop' as well as a rather rapid 'poo-poo-poo-poop', and birds may sit and call for long periods."
            self.scientificName.text = "Phapitreron amethystinus"
            self.notice.text = notice
        case "Balabac Mouse Deer":
            self.status.text = "Endangered"
            self.specieDesc.text = "also known as the Balabac chevrotain or pilandok (in Filipino), is a small, nocturnal ruminant, which is endemic to Balabac and nearby smaller islands (Bugsuk and Ramos) southwest of Palawan in the Philippines."
            self.scientificName.text = "Tragulus nigricans"
            self.notice.text = notice
        case "Blue Naped Parrot":
            self.status.text = "Near Threatened"
            self.specieDesc.text = " also known as the blue-crowned green parrot, Luzon parrot, the Philippine green parrot, and locally known as pikoy, is a parrot found throughout the Philippines."
            self.scientificName.text = "Tanygnathus lucionensis"
            self.notice.text = notice
        case "Calamian Deer":
            self.status.text = "Endangered"
            self.specieDesc.text = "also known as Calamian hog deer,[3] is an endangered species of deer found only in the Calamian Islands of Palawan province of the Philippines. It is one of three species of deer native to the Philippines, the other being the Philippine sambar (Cervus mariannus), and Visayan spotted deer (Cervus alfredi)."
            self.scientificName.text = "Hyelaphus calamianensis"
            self.notice.text = notice
        case "Colasisi":
            self.status.text = "Least Concern"
            self.specieDesc.text = "The Philippine hanging parrot (Loriculus philippensis) is also widely known as the colasisi[2] taken from its local Tagalog name, 'kulasisi'. It is a small parrot species of the family Psittaculidae."
            self.scientificName.text = "Loriculus philippensis"
            self.notice.text = notice
        case "Common Hill Myna":
            self.status.text = "Least Concern"
            self.specieDesc.text = "sometimes spelled 'mynah' and formerly simply known as the hill myna or myna bird, is the myna most commonly seen in aviculture, where it is often simply referred to by the latter two names. It is a member of the starling family (Sturnidae), resident in hill regions of South Asia and Southeast Asia. "
            self.scientificName.text = "Gracula religiosa"
            self.notice.text = notice
        case "Giant Golden-Crowned Flying Fox":
            self.status.text = "Endangered"
            self.specieDesc.text = "also known as the golden-capped fruit bat, is a species of megabat endemic to the Philippines. Since its description in 1831, three subspecies of the giant golden-crowned flying fox have been recognized, one of which is extinct. The extinct subspecies (A. jubatus lucifer) was formerly recognized as a full species, the Panay golden-crowned flying fox. "
            self.scientificName.text = "Acerodon jubatus"
            self.notice.text = notice
        case "Green Raket-Tail":
            self.status.text = "Endangered"
            self.specieDesc.text = "is an endemic parrot of the Philippines where it is found on Luzon and Marinduque.[2][3] This species was once common,[3] but is rapidly declining and is currently classified as vulnerable due to lowland deforestation and capture for cage-bird trade.[4]"
            self.scientificName.text = "Prioniturus luconensis"
            self.notice.text = notice
        case "Green Turtle":
            self.status.text = "Endangered"
            self.specieDesc.text = "also known as the green turtle, black (sea) turtle or Pacific green turtle,[3] is a species of large sea turtle of the family Cheloniidae. It is the only species in the genus Chelonia.[4] Its range extends throughout tropical and subtropical seas around the world, with two distinct populations in the Atlantic and Pacific Oceans, but it is also found in the Indian Ocean"
            self.scientificName.text = "Chelonia mydas"
            self.notice.text = notice
        case "Hawksbill Turtle":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "is a critically endangered sea turtle belonging to the family Cheloniidae. It is the only extant species in the genus Eretmochelys. The species has a worldwide distribution, with Atlantic and Indo-Pacific subspecies—E. i. imbricata and E. i. bissa, respectively."
            self.scientificName.text = "Eretmochelys imbricata"
            self.notice.text = notice
        case "Leatherback Turtle":
            self.status.text = "Vulnerable"
            self.specieDesc.text = "sometimes called the lute turtle or leathery turtle or simply the luth, is the largest of all living turtles and is the fourth-heaviest modern reptile behind three crocodilians.[5][6] It is the only living species in the genus Dermochelys and family Dermochelyidae. It can easily be differentiated from other modern sea turtles by its lack of a bony shell, hence the name. Instead, its carapace is covered by skin and oily flesh."
            self.scientificName.text = "Dermochelys coriacea"
            self.notice.text = notice
        case "Leopard Cat":
            self.status.text = "Least Concern"
            self.specieDesc.text = "is a small wild cat native to continental South, Southeast, and East Asia. Since 2002 it has been listed as Least Concern on the IUCN Red List as it is widely distributed although threatened by habitat loss and hunting in parts of its range."
            self.scientificName.text = "Prionailurus bengalensis"
            self.notice.text = notice
        case "Negros Bleeding Heart":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "is endemic to the Philippines where it is found on the islands of Negros and Panay. It is critically endangered; continuing rates of forest loss on the two islands where it occurs suggest that it will continue to decline. The species has an extremely small, severely fragmented population.[3] The bird is listed as an EDGE species under the analysis of the Zoological Society of London."
            self.scientificName.text = "Gallicolumba keayi"
            self.notice.text = notice
        case "Palawan Forest Turtle":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "is a species of freshwater turtle endemic to the Philippines. It is classified as critically endangered.It is known as the Philippine forest turtle, the Philippine pond turtle, the Palawan turtle, or the Leyte pond turtle. Despite the latter common name, it does not occur in the island of Leyte but is instead native to the Palawan island group. It is locally known as bakoko in Cuyonon."
            self.scientificName.text = "Siebenrockiella leytensis"
            self.notice.text = notice
        case "Palawan Peacock-Pheasant":
            self.status.text = "Vulnerable"
            self.specieDesc.text = "is a medium-sized (up to 50 cm long) bird in the family Phasianidae.The Palawan peacock-pheasant is featured prominently in the culture of the indigenous people of Palawan. The bird is also depicted in the official seal of the city of Puerto Princesa."
            self.scientificName.text = "Polyplectron napoleonis"
            self.notice.text = notice
        case "Panay Forest Monitor Lizard":
            self.status.text = "Endangered"
            self.specieDesc.text = " is an endangered monitor lizard native to Panay Island in the Philippines. Unlike most monitors, it is a specialized frugivore.[4]"
            self.scientificName.text = "Varanus mabitang"
            self.notice.text = notice
        case "Philippine Crocodile":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "also known as the Mindoro crocodile, the Philippine freshwater crocodile, the bukarot[2] in Ilocano, and more generally as a buwaya in most Filipino lowland cultures,[2] is one of two species of crocodiles found in the Philippines; the other is the larger saltwater crocodile (Crocodylus porosus).[3][4] The Philippine crocodile, the species endemic only to the country, became data deficient to critically endangered in 2008 from exploitation and unsustainable fishing methods,[5] such as dynamite fishing"
            self.scientificName.text = "Crocodylus mindorensis"
            self.notice.text = notice
        case "Philippine Duck":
            self.status.text = "Vulnerable"
            self.specieDesc.text = "is a large dabbling duck of the genus Anas. Its native name is papan. It is endemic to the Philippines. As few as 5,000 may remain. Overhunting and habitat loss have contributed to its decline. It eats shrimp, fish, insects, and vegetation, and it frequents all types of wetlands.[2]"
            self.scientificName.text = "Anas luzonica"
            self.notice.text = notice
        case "Philippine Eagle":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "is an endangered species of eagle of the family Accipitridae which is endemic to forests in the Philippines. It has brown and white-colored plumage, a shaggy crest, and generally measures 86 to 102 cm (2.82 to 3.35 ft) in length and weighs 4.04 to 8.0 kg (8.9 to 17.6 lb). It is considered the largest of the extant eagles in the world in terms of length and wing surface, with Steller's sea eagle and the harpy eagle being larger in terms of weight and bulk."
            self.scientificName.text = "Pithecophaga jefferyi"
            self.notice.text = notice
        case "Philippine Eagle-Owl":
            self.status.text = "Vulnerable"
            self.specieDesc.text = " is a vulnerable species of owl belonging to the family Strigidae. It is endemic to the Philippines, where found in lowland forests on the islands of Catanduanes, Samar, Bohol, Mindanao, Luzon, Leyte and possibly Sibuyan.[2] It is known locally as the kuwago or bukaw."
            self.scientificName.text = "Bubo philippensis"
            self.notice.text = notice
        case "Philippine Pangolin":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "also locally known as balintong, is a pangolin species endemic to the Palawan province of the Philippines. Its habitat includes primary and secondary forests, as well as surrounding grasslands. This species is moderately common within its limited range, but is at risk due to heavy hunting because of its valued scales and meat"
            self.scientificName.text = "Manis culionensis"
            self.notice.text = notice
        case "Pinsker's Hawk Eagle":
            self.status.text = "Endangered"
            self.specieDesc.text = " south Philippine hawk-eagle or Mindanao hawk-eagle, is a species of bird of prey in the family Accipitridae.[2][3][4] It is native to the islands of Leyte, Samar, Negros and Mindanao in the Philippines."
            self.scientificName.text = "Nisaetus pinskeri"
            self.notice.text = notice
        case "Red Vented Cockatoo":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "also known as the Philippine cockatoo and locally katala, abukay, agay or kalangay, is a critically endangered species of cockatoo that is endemic to the Philippines. It is roughly the size and shape of the Tanimbar corella, but is easily distinguished by the red feathers around the vent."
            self.scientificName.text = "Cacatua haematuropygia"
            self.notice.text = notice
        case "Rufous Hornbill":
            self.status.text = "Vulnerable"
            self.specieDesc.text = "also known as the Philippine hornbill and locally as kalaw (pronounced kah-lau), is a large species of hornbill."
            self.scientificName.text = "Buceros hydrocorax"
            self.notice.text = notice
        case "Sulu Hornbill":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "is a species of hornbill in the family Bucerotidae. It is endemic to the Sulu archipelago in the Philippines, with the largest remaining populations in Tawi-Tawi.[1][2][3] Its natural habitat is subtropical or tropical moist montane forests. It is threatened by habitat loss as well as potential harvesting for food.[1] Its diet includes fruit, insects, and small lizards."
            self.scientificName.text = "Anthracoceros montani"
            self.notice.text = notice
        case "Visayan Hornbill":
            self.status.text = "Endangered"
            self.specieDesc.text = "is a hornbill found in rainforests on the islands of Panay, Negros, Masbate, and Guimaras, and formerly Ticao, in the Philippines. It formerly included all other Philippine tarictic hornbills as subspecies, in which case the common name of the 'combined species' was shortened to tarictic hornbill."
            self.scientificName.text = "Penelopides panini"
            self.notice.text = notice
        case "Visayan Spotted Deer":
            self.status.text = "Endangered"
            self.specieDesc.text = "also known as the 'Philippine spotted deer' or 'Prince Alfred's deer', is a nocturnal and endangered species of deer located primarily in the rainforests of the Visayan islands of Panay and Negros though it once roamed other islands such as Cebu, Guimaras, Leyte, Masbate, and Samar. It is one of three endemic deer species in the Philippines, although it was not recognized as a separate species until 1983."
            self.scientificName.text = "Rusa alfredi"
            self.notice.text = notice
        case "Visayan Warty Pig":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "is a critically endangered species in the pig genus (Sus). It is endemic to six of the Visayan Islands (Cebu, Negros, Panay, Masbate, Guimaras, and Siquijor) in the central Philippines. It is known by many names in the region (depending on the island and linguistic group) with most translating into 'wild pig': baboy ihalas ('wild pig' in Cebuano and Hiligaynon), baboy talonon ('forest pig' in Hiligaynon), and baboy sulop ('dark pig' in Cebuano)"
            self.scientificName.text = "Sus cebifrons"
            self.notice.text = notice
        default:
            self.status.text = "N/A"
            self.specieDesc.text = "Insert Desctiption"
            self.scientificName.text = "Insert Scientific Name"
            self.notice.text = "It is illegal to capture, sell, or possess wildlife and souvenirs made from their parts. Be a protector of Philippine Wildlife."
        }
        
        
    }

    @IBAction func camera(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    

}
