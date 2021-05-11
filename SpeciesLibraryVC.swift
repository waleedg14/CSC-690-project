//
//  SpeciesLibraryVC.swift
//  Wildify
//
//  Created by Victor Callejas on 4/15/21.
//
//

import UIKit
import AVFoundation

class SpeciesLibraryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var superV: UIView!
    
    var specieNames = ["Tamaraw (Bubalus mindorensis)", "Dugong", "Philippine Eagle", "Red-Vented Cockatoo", "Colasisi", "Palawan Forest Turtle", "Giant Golden-crowned Flying Fox", "Visayan Spotted Deer", "Hawksbill Turtle", "Leatherback turtle","Philippine Corcodile ","Panay Forest monitor lizard","Sulu hornbil","Visayan Hornbill","Blue-naped Parrot","Negros bleeding-hoart","Amethyst brown dove","Green Racket-tail","Philippine Pangolin","Palawan Peacock-pheasant","Pinsker's hawk-eagle","Philippine wartly pig","Calamian Deer","Green Turtle","Rufous hornbill","Philippine Eagle-owl","Leopard Cat","Philippine Duck","Common hill myna","Balabac Mouse deer"]
    var specieImages = ["tamaraw", "dugong", "philippine-eagle", "red-vented", "colasisi","palawan-forest","giant-golden","visayan-spotted","hawksbill","leatherback","crocodile","panay-forest","sulu-hornbill","visayan-hornbill","blue-naped","negros-bleeding","amethyst","green-racket","pangolin","palawan-peacock","pinskers","wartly-pig","calamian","green-turtle","rufous","eagle-owl","leopard","duck","hillmyna","balabac",]
    var specieDescription = [
        "Head and neck: dark brown to brownish black; pair of horns short, triangular at base with pronounced grooves at base, close together, sharply pointed at tip, pointed backwards; ears moderate.",
        "A marine mammal that has been recorded in the shallow coasts and mangrove channels throughout the Philippines. The body, flippers and tail flukes look similar to that of a dolphin except that it lacks a dorsal fin. The body is grey but appears brown when observed at sea. The head is distinctive, with the mouth opening downward below a flat broad muzzle. Adult males and some old females have tusks. They are the only marine mammals that are completely herbivorous. They have been heavily exploited in the Philippines, almost to extinction. Populations have drastically declined in much of its global range, facing a high risk of extinction in the wild.",
        "The largest raptor in the Philippines; 90-100 cm TL; 4.7-8.0 kg Head and neck: Head white covered with shaggy crest of long slender feathers; crest white and brown lanceolated feathers; face white; around eye and chin covered with black hair-like feathers; eye bluish grey; cere grey; bill large and bluish grey with black tip.",
        "The plumage is all white with red undertail coverts tipped white, yellowish undertail and pale yellow underwings. It is 12 inches (30 cm) long and has an 8.6-inch (22 cm) wingspan.",
        "The smallest Philippine parrot is common and can be found in all forest types up to montane forest and even in gardens in cities. It feeds on flowers and nectar, especially from coconuts and bananas. Easily identified by red on head and rump. Ten races are known from the Phillipines, where it is endemic, of which the Cebu and Mindoro subspecies are very rare, explaining the threat status.",
        "An endemic turtle confined to Palawan Island Group. The carapace of S. leytensis is wide, somewhat flattened, and heavily buttressed. The head is large, the snout projecting and rounded, and the nostrils are placed anteriorly. It is observed in streams, creeks, medium-sized rivers in lowland forest and second-growth vegetation. This species under threat due to habitat destruction and natural and man made factors (exotic animal trade and traditional medicine). The species has also limited geographic range and restricted population with observation of reduction in their population size.",
        "Head and neck: golden brown fur from top of head to nape or shoulders. Body: largest bat in the Philippines; wing membranes medium to dark brown with irregular pale and dark blotches. Limbs and tail: Forearm 18 to 19.5 cm; thumb thick and long (6.5 to 7.5 cm); no tail.",
        "The only native medium-sized deer that is endemic to the primary and secondary forests of the Negros-Panay Faunal Region. Fur generally varies from pale reddish-brown to dark brown or nearly black as in the neck of some males, with pale spots on the sides and back. The underside of the jaw and upper throat are white. Adult males have small antlers, while females have none. Their ecology is poorly known. They are now geographically restricted and rare, and are heavily hunted. Populations are severely endangered, with those in Cebu, Guimaras, and probably Masbate now locally extinct.",
        "Widespread in the Philippines. The head is narrow and has two pairs of prefrontal scales with non serrated jaw. Carapace bony without ridges, over-lapping scutes and presence of four lateral scutes. Carapace elliptical in shape with flippers having two claws. Carapace color from orange, brown or yellow. This species under threat due to habitat destruction and other natural/manmade factors such as trade for commercial use and curio.",
        "The only sea turtle that lacks hard shell. Head has a deeply notched upper jaw with two cusps. Carapace large, elongated and flexible with seven distinct ridges running the entire length of the animal. All flippers are without claws. Carapace color is dark grey or black with white or pale spots, while the plastron is whitish to black and marked by five ridges. This species under threat due to habitat destruction and other natural/manmade factors such as pollution and boat propellor strike.",
        "The Philippine crocodiles is brown with black markings. It is a smaller member of the crocodile family, with males growing up to 10 feet (3 meters) long. Females are typically smaller. and heavily armored. It has a broad snout for a crocodile.",
        "Head and neck: uniform black; nostril slit-like. Body: black; robust; 70 cm SVL. Dorsal - black with tiny yellow markings; Ventral - dark grey to blackish grey; scales keeled. Limbs and tail: Tail length 1.36 to 1.61 of SVL; digits terminate in a robust, recurved claws.",
        "Extremely rare and only known hornbill unique to the Sulu archipelago where a tiny population is now known to be confined to lowland forests of Tawi-Tawi. Both Jolo and SangaSanga no longer harbors primary forests. A moderately large blackish hornbill with a black bill and casque, and a white tail. Its presence can be recognized from its loud shrieks and cackling calls. Due to its rapid decline from continued habitat loss from forest conversion, exploitation, and limited nestsites, it is classified as Critically Endangered. Conservation efforts should be aimed at protecting remnant habitats at Tawi-Tawi and possibly captive-breeding",
        "Small sized hornbill endemic to Western Visayas, including Negros, Panay, Masbate, Guimaras, Pan de Azucar, Sicogon and Ticao (with distinct extinct subspecies, ticaensis), where it inhabits forest habitats usually below 1500 m, but has been extirpated in smaller islands. Sexes distinguishable from fledging, as males are blackish-brown and buffy white, with dark parts having a green gloss, and white facial skill skin. Females are all blackish-brown with blue facial skin. Tail buff white with black and rufous bands. Uncommon to rare in remnant forests on Negros and Panay. Limited occupancy and declining population, due to continued habitat loss and exploitation.",
        "Head and neck: Forehead, lores, and sides of head bluish green; crown and nape bright blue; eye yellow (female); outer ring white, inner ring yellow (male); cere black; bill reddish orange with yellow tip. Body: Above and below yellowish green; wing green; wing coverts blue with yellow edges (scalloping pattern). Limbs and tail: Legs and feet greyish green to black; tail green.",
        "Rare, poorly known species occurring only on the islands of Negros and Panay. Note the broad white wing bar, white center of breast with narrow orange breast stripe, and nearly complete metallic green/purple breast band. This species has an extremely small, severely fragmented population that is likely to be undergoing a continuing decline owing to forest loss on the only two islands where it occurs",
        "Common locally, in forest and forest edge up to 2000 m, singly or in pairs. In Mindanao it tends to be more common at elevations above 1000 m. Larger bill, less conspicuous white ‘ear’, violet upper back, and cinnamon undertail coverts separate it from White-eared Brown Dove. Although this species, endemic to the Philippines, generally appears to have a stable population size and occurs on a good number of islands, this species is included as Critically Endangered due to the subspecies frontalis, which occurs only on the island of Cebu and might even be extinct",
        "The smallest of the racket-tails, it is uncommon and becoming ever rarer, found in lowland forest and edge in pairs or small groups, only on Luzon Island. Loud and noisy, all green with no blue in face or upperparts. Distinguished from the Larger Blue-naped and Blue-backed Parrots as these have longer tails and red bills. Its population is estimated to be very small, and less numerous than previously thought, and is inferred to be in on-going decline owing to trapping pressure, and the loss and degradation of suitable habitat",
        "Head and neck: Head elongated; sides of face and neck no scales, with some hair; and scales cover top of head; well-developed external ear; ears small, oriented on the side of the head; scales remain fairly uniform in size behind ears; skin is lighter color than scales; scales on nuchal region small. Body: Dorsal body covered with overlapping scales; scales light brown; median row of 28 to 32 scales on head and body; ventral with hair, no scales; rolls into a ball when threatened. Limbs and tail: Limbs robust; large claws on front feet larger; 28 to 32 scales along edge of tail; tail long, shorter than total of head and body length, prehensile, covered with scales.",
        "Head and neck: Long, pointed crest iridescent green (male), short crest, brown (female); crown iridescent green; white stripe above the eye from base of bill to nape and white facial patch (male); face brownish white (female); eye dark brown; skin around eye pinkish; bill black with dark brown tip. Body: Upper back iridescent blue; back and rump dark brown with black scalloping; lesser wing coverts iridescent blue; median and greater coverts iridescent green (male); overall reddish brown (female). Limbs and tail: Legs and feet grey; male with short tarsal spur; tail two rows of iridescent ocelli (eyespots) (male), uniform brown (female).",
        "Very similar in appearance and habits to the Philippine Hawk-eagle from which it was recently split. Medium-sized eagle with longish, black crest, which is uncommonly found in forest from the lowlands to over 1900 m. With its main stronghold in Mindanao Island, it also suffers from lowland habitat loss and hunting.",
        "The Philippine warty pig is one of four known species in the pig genus endemic to the Philippines. The other three endemic species are the Visayan warty pig, Mindoro warty pig and the Palawan bearded pig, also being rare members of the family Suidae.",
        "The only native deer in the Palawan Faunal Region. It is a small deer with brown fur, except for the rims of the ears which are sometimes black, and the tip of the short tail which is white. Young deers have scattered white spots. They inhabit grasslands and second growth, and mixed forest and grassland. They form fairly large herds, and are common when not hunted. Populations are threatened because of their very limited range and the continued hunting pressure.",
        "Widespread in the Philippines. The head is small and blunt with serrated jaw. Carapace without bony ridges and large, non-overlapping scutes and presence of 4 lateral scutes. Body almost oval shape with flippers having 1 visible claw. Carapace color varies from pale to very dark green and plain to very brilliant yellow. This species under threat due to habitat destruction and other natural/man",
        "Uncommon moderately-sized hornbill unique to Mindanao and adjacent islands, including Camiguin Sur, Siargao and Dinagat, where it inhabits forests below 1200 m. They often travel in pairs or small groups across the forest canopy, distinguished from sympatric Tarictic and Rufous hornbills by their medial-size and loud nasal stuttering call. Generally black with a bluish-green gloss, and buffy white tails with black terminal bands. Sexes and ages differ in plumage, bill and casque elaboration (wrinkled grooves), and color of soft parts",
        "Large, stocky, endemic tufted owl that inhabits lowland and secondary forests often near rivers and lakes on eastern Philippines, with two distinct subspecies; philippensis for Luzon and Catanduanes, and the larger mindanensis for Mindanao, Samar, Leyte and Bohol. Plumage generally rufous (philippensis) to dark brown (mindanensis) broadly streaked with blackish-brown, underparts paler. Facial disc pale rufous and lores buff white with black bristles. Legs fully feathered up to toes. Eyes are brown. Sexes similar, but females usually larger and paler. Endangered due to its limited occurrence, continued habitat loss, and exploitation for the wildlife trade",
        "Found only on Negros and Palawan Islands, but has been reported in Cebu and Panay. It is larger than a typical household cat with TL 479-708 mm. It differs in color from a household cat by conspicuous dark spots and other marking on the upperparts. It is found in primary and secondary forest and in agricultural areas particularly in sugar cane plantations on Negros. Local populations are uncommon but widespread, and are probably declining due to hunting.",
        "Endemic to the Philippines and present on all major islands except for Palawan. Previously very common in freshwater marshes, shallow lakes and ricefields, sometimes in bays, in pairs or flocks often with other surface-feeding ducks. It is easily identified by its cinnamon rust-colored head with dark brown crown and line through the eye with fairly uniform greyish brown body. Currently undergoing a rapid and continuing decline owing to extensive over-hunting and the widespread conversion of its wetland habitat",
        "Most traded bird species in the illegal pet trade in Palawan, possibly causing its disappearance from certain areas. Its body is black and bulky, with a white patch on its wings, orange-red bill, orange yellow wattles, and bare head. The species’ core habitat is closed forest; it depends on larger trees with cavities, which it predates from other birds such as parrots and hornbills. More effective law enforcement is recommended to help stem local trade of these animals.",
        "Head and neck: pointed snout, black; mixed of black and brown hair; brown above eye; eyes large; no horns; adults with conspicious canines; neck and chest with white stripes. Body: tiny deer-like animal; brown; back and sides with black hair with white base and black tip; 18 cm height at shoulder. Limbs and tail: limbs slender; feet small; tail short.",
    ]
    
    //let primaryAppColor = UIColor(named: "#326DB4")
    let colorArray = [ UIColor(hexString: "#FCFFE6"),UIColor(hexString: "#A7E8CA"),UIColor(hexString: "#CDC9E0"),UIColor(hexString: "#FFE5D9"),UIColor(hexString: "#BABABA"),UIColor(hexString: "#9DB7B7"),UIColor(hexString: "#FCFFE6"),UIColor(hexString: "#A7E8CA"),UIColor(hexString: "#CDC9E0"),UIColor(hexString: "#FFE5D9"),UIColor(hexString: "#BABABA"),UIColor(hexString: "#9DB7B7"),UIColor(hexString: "#FCFFE6"),UIColor(hexString: "#A7E8CA"),UIColor(hexString: "#CDC9E0"),UIColor(hexString: "#FFE5D9"),UIColor(hexString: "#BABABA"),UIColor(hexString: "#9DB7B7"),UIColor(hexString: "#FCFFE6"),UIColor(hexString: "#A7E8CA"),UIColor(hexString: "#CDC9E0"),UIColor(hexString: "#FFE5D9"),UIColor(hexString: "#BABABA"),UIColor(hexString: "#9DB7B7"),UIColor(hexString: "#FCFFE6"),UIColor(hexString: "#A7E8CA"),UIColor(hexString: "#CDC9E0"),UIColor(hexString: "#FFE5D9"),UIColor(hexString: "#BABABA"),UIColor(hexString: "#9DB7B7")]
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
extension SpeciesLibraryVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specieNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeciesLibTabCell", for: indexPath) as! SpeciesLibTabCell
        let imgName = specieImages[indexPath.row] ?? ""
        cell.libImg.image = UIImage(named: imgName)
        cell.titleLbl.text = specieNames[indexPath.row] ?? ""
        cell.descriptionLbl.text = specieDescription[indexPath.row] ?? ""
        cell.imgView.backgroundColor = colorArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let img = specieImages[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SpeciesDetailVC") as! SpeciesDetailVC
        vc.detailIm = img
        vc.center = "Source: Philippine Red List"
        vc.desc = specieDescription[indexPath.row]
        vc.titlestr =  specieNames[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension UIView {

    func roundCorners(corners:UIRectCorner, radius: CGFloat) {

        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}
