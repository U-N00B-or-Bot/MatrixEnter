//U-N00B-or-Bot

import UIKit

class SecondViewController: UIViewController {
    
   // override var prefersStatusBarHidden: Bool {
  //      return true
  //  }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    @IBOutlet weak var hello: UILabel!
    
    @IBOutlet weak var ExitBtn: UIButton!
    
    
   var abc = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        hello.text = abc
        ExitBtn.layer.cornerRadius = 10
        
    }

}
