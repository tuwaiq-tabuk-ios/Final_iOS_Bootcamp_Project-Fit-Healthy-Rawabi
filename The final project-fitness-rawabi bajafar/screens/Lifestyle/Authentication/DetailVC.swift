//

import UIKit

class DetailVC: UIViewController {
  
  @IBOutlet var descriptionLabel: UITextField!
  
  var descriptionText: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    descriptionLabel.text = descriptionText
  }
  
  
}
