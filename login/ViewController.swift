//U-N00B-or-Bot

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var enterYourName: UITextField!
    @IBOutlet weak var enterYourPassword: UITextField!
    
    @IBOutlet weak var btn: UIButton!
    
    var player: AVPlayer?
    let videoURL: NSURL = Bundle.main.url(forResource: "intro", withExtension: "MP4")! as NSURL
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = AVPlayer(url: videoURL as URL)
        player?.actionAtItemEnd = .none
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer.zPosition = -1
        
        playerLayer.frame = view.frame
        view.layer.addSublayer(playerLayer)
        
        player?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loopVideo), name:  NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player)
        
        
        enterYourName.rightViewMode = .always
        enterYourName.rightView = UIImageView(image: UIImage(systemName: "person"))
        enterYourName.attributedPlaceholder = NSAttributedString(string: "Enter your name", attributes: [NSAttributedString.Key.foregroundColor:UIColor.darkGray])
        
        enterYourPassword.rightViewMode = .always
        enterYourPassword.rightView = UIImageView(image: UIImage(systemName: "lock"))
        enterYourPassword.attributedPlaceholder = NSAttributedString(string: "Enter your password", attributes: [NSAttributedString.Key.foregroundColor:UIColor.darkGray])
    }
    
    
    
    func playerItemDidRechEnd() {
        player!.seek(to: CMTime.zero)
    }
    
    @objc func loopVideo() {
        player?.seek(to: CMTime.zero); player?.play()
    }
    
    
    
    let userName = "Neo"
    let password = "Matrix"
    
    override func viewDidLayoutSubviews() {
        btn.layer.cornerRadius = 10
    }
    
    
   
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let text = enterYourName.text!
        let pass = enterYourPassword.text!
        if segue.identifier == "goToSecond" && text == userName && pass == password{
            let newVC = segue.destination as! SecondViewController
            newVC.abc = "Hello, \(text)!\n i am the architect!"
        
        }
        else {
            let allertController = UIAlertController(title: "Access Denied", message: "Wrong user name or password", preferredStyle: .alert)
                let action = UIAlertAction(title: "Cancel", style: .cancel) { action in
                }
                allertController.addAction(action)
                self.present(allertController, animated: true, completion: nil)
            enterYourName.text = ""
            enterYourPassword.text = ""
        }
    }
    
 

    @IBAction func forgotNamePress(_ sender: Any) {
        let allertController = UIAlertController(title: "Forgot name?", message: "No problem! Your name is Neo.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Understand", style: .default) { action in
            }
            allertController.addAction(action)
            self.present(allertController, animated: true, completion: nil)
            enterYourName.text = "Wake up, Neo..."
    }
    
    @IBAction func forgotPasswordPress(_ sender: Any) {
        let allertController = UIAlertController(title: "Forgot password?", message: "No problem! Your pass is Matrix.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Understand", style: .default) { action in
            }
            allertController.addAction(action)
            self.present(allertController, animated: true, completion: nil)
            enterYourName.text = "Follow the white rabbit."
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        
        enterYourName.text = ""
        enterYourPassword.text = ""
    }

}
