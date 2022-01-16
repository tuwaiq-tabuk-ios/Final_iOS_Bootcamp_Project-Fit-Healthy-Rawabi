//

import UIKit

class DetailVC: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet var descriptionLabel: UITextField!
  
  
  
  // MARK: - Properties
  
  var descriptionText: String = ""
  
  
  
  // MARK: - View controller lifecycle
  
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
