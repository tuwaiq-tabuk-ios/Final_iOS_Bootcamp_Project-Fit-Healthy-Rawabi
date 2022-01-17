//
//  

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
  
  
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var emailTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var loginButton: UIButton!
  
  @IBOutlet weak var errorLabel: UILabel!
  
  
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.Keyboard()
    emailTextField.text = "testRawabi1@gmail.com"
    passwordTextField.text = "123_$Ff3RrSs"
    navigationItem.backButtonTitle = ""
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    // Do any additional setup after loading the view.
    
    setUpElements()
  }
  
  
  
  // MARK: - Methods
  
  func setUpElements() {
    
    // Hide the error label
    errorLabel.alpha = 0
    
    // Style the elements
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilledButton(loginButton)
    
  }
  
  
  
  // MARK: - @IBAction
  
  @IBAction func loginTapped(_ sender: Any) {
    
    // TODO: Validate Text Fields
    
    // Create cleaned versions of the text field
    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // Signing in the user
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      
      if error != nil {
        // Couldn't sign in
        self.errorLabel.text = error!.localizedDescription
        self.errorLabel.alpha = 1
      }
      else {
        
        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.StoryboardHome.homeViewController) as? TabBarVC
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
      }
    }
  }
  
}
