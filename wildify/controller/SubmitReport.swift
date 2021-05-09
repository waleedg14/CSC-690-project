

import Foundation
import UIKit

class SubmitReport: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
       
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @IBAction func report(_ sender: Any) {
        let id = "1900712493589146"
           // If you have User id the use this URL
           let urlWithId = "fb-messenger-public://user-thread/\(id)"
            print (urlWithId)
           // If you don't have User id then use this URL
           let urlWithoutId = "fb-messenger-public://user-thread"
           if let url = URL(string: urlWithId) {

               // this will open your Messenger App
               UIApplication.shared.open(url, options: [:], completionHandler: {
                   (success) in

                   if success == false {
                       // If Messenger App is not installed then it will open browser.
                       // If you have User id the use this URL
                       let urlWithIdForBrowser = "https://m.me/\(id)"
                       // If you don't have User id then use this URL
                       let urlWithoutIdForBrowser = "https://m.me"
                       let url = URL(string: urlWithIdForBrowser)
                       if UIApplication.shared.canOpenURL(url!) {
                           UIApplication.shared.open(url!)
                       }
                   }
               })
           }
           
    }
    
}
