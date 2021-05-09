
import UIKit
import SceneKit
import ARKit
import AVFoundation
import SpriteKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        //        // Create a new scene
        //        let scene = SCNScene(named: "art.scnassets/animal.scn")!
        //
        //        // Set the scene to the view
        //        sceneView.scene = scene
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        guard let arImages = ARReferenceImage.referenceImages(inGroupNamed: "Animal Cards", bundle: Bundle.main)
        else{ return }
        configuration.trackingImages = arImages
        configuration.maximumNumberOfTrackedImages = 10
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        if let imageAnchor = anchor as? ARImageAnchor{
            //            let videoNode = SKVideoNode(fileNamed: "elephant.mp4")
            //                videoNode.play()
            //
            //                let videoScene = SKScene(size: CGSize(width: 1080, height: 720))
            //                videoNode.position = CGPoint(x: videoScene.size.width / 2 , y: videoScene.size.height / 2)
            //                videoNode.yScale = -1.0
            //                videoScene.addChild(videoNode)
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            //                plane.firstMaterial?.diffuse.contents = videoScene
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
            if imageAnchor.referenceImage.name == "eagle-card" {
                //
                if let eagleScene = SCNScene(named: "art.scnassets/eagle.scn"){
                    if let eagleNode = eagleScene.rootNode.childNodes.first {
                        print("eagle")
                        planeNode.addChildNode(eagleNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "pig-card" {
                //
                
                if let pigScene = SCNScene(named: "art.scnassets/pig.scn"){
                    if let pigNode = pigScene.rootNode.childNodes.first {
                        print("pig")
                        planeNode.addChildNode(pigNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "colasisi-card" {
                //
                
                if let colasisiScene = SCNScene(named: "art.scnassets/colasisi.scn"){
                    if let colasisiNode = colasisiScene.rootNode.childNodes.first {
                        print("colasisi")
                        planeNode.addChildNode(colasisiNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "leopard-card" {
                //
                
                if let colasisiScene = SCNScene(named: "art.scnassets/leopard.scn"){
                    if let colasisiNode = colasisiScene.rootNode.childNodes.first {
                        print("colasisi")
                        planeNode.addChildNode(colasisiNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "tamaraw-card" {
                //
                
                if let colasisiScene = SCNScene(named: "art.scnassets/tamaraw.scn"){
                    if let colasisiNode = colasisiScene.rootNode.childNodes.first {
                        print("colasisi")
                        planeNode.addChildNode(colasisiNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "turtle-card" {
                //
                
                if let colasisiScene = SCNScene(named: "art.scnassets/turtle.scn"){
                    if let colasisiNode = colasisiScene.rootNode.childNodes.first {
                        print("colasisi")
                        planeNode.addChildNode(colasisiNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "myna-card" {
                //
                
                if let colasisiScene = SCNScene(named: "art.scnassets/myna.scn"){
                    if let colasisiNode = colasisiScene.rootNode.childNodes.first {
                        print("colasisi")
                        planeNode.addChildNode(colasisiNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "dugong-card" {
                //
                
                if let colasisiScene = SCNScene(named: "art.scnassets/dugong.scn"){
                    if let colasisiNode = colasisiScene.rootNode.childNodes.first {
                        print("colasisi")
                        planeNode.addChildNode(colasisiNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "calamian-card" {
                //
                
                if let colasisiScene = SCNScene(named: "art.scnassets/calamian.scn"){
                    if let colasisiNode = colasisiScene.rootNode.childNodes.first {
                        print("colasisi")
                        planeNode.addChildNode(colasisiNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "mouse-card" {
                //
                
                if let colasisiScene = SCNScene(named: "art.scnassets/mouse.scn"){
                    if let colasisiNode = colasisiScene.rootNode.childNodes.first {
                        print("colasisi")
                        planeNode.addChildNode(colasisiNode)
                    }
                }
            }

            
        }
        
        
        return node
        
    }
    
}
