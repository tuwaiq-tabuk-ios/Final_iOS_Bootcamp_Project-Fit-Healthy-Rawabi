//

import UIKit

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.backButtonTitle = ""
    overrideUserInterfaceStyle = .light
    
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
}
