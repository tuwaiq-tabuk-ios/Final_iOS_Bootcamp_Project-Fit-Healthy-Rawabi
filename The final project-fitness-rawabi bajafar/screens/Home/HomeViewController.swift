//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.backButtonTitle = ""
    overrideUserInterfaceStyle = .light
    
    navigationItem.setHidesBackButton(true, animated: true)
  }
}
