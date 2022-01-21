
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
  
  let defaults = UserDefaults.standard
  
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var firstNameTextField: UITextField!
  
  @IBOutlet weak var lastNameTextField: UITextField!
  
  @IBOutlet weak var emailTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet var Confirm: CMTextField!
  
  @IBOutlet weak var signUpButton: UIButton!
  
  @IBOutlet weak var errorLabel: UILabel!
  
  @IBOutlet var weightTextField: UITextField!
  
  @IBOutlet var heightTextField: UITextField!
  
  @IBOutlet var dateOfBirthTextField: UITextField!
  
  @IBOutlet var confirmTextField: CMTextField!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.Keyboard()
   
    firstNameTextField.text = "rawabi"
    lastNameTextField.text = "Ahmed"
    emailTextField.text = "testRawabi1@gmail.com"
    passwordTextField.text = "123_$Ff3RrSs"
    weightTextField.text = "55"
    heightTextField.text = "156"
    dateOfBirthTextField.text = "2-3-2020"
    confirmTextField.text = "123_$Ff3"
    // Do any additional setup after loading the view.
    setUpElements()
    
    navigationItem.backButtonTitle = ""
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  
  
  
  // MARK: - Methods
  
  func setUpElements() {
    
    // Hide the error label
    errorLabel.alpha = 0
    
    // Style the elements
    Utilities.styleTextField(firstNameTextField)
    Utilities.styleTextField(lastNameTextField)
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleTextField(Confirm)
    Utilities.styleFilledButton(signUpButton)
    Utilities.styleTextField(weightTextField)
    Utilities.styleTextField(heightTextField)
    Utilities.styleTextField(dateOfBirthTextField)
    
  }
  
  

  // MARK: - @IBAction
  
  @IBAction func signUpTapped(_ sender: Any) {
    
    signUp()
    
  }
  // MARK: - Methods
  
  private func signUp() {
    
    guard let email = emailTextField.text,
          email.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the email"
            return
          }
    
    guard let password = passwordTextField.text,
          password.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Enter the password"
            return
          }
    
    guard let firstName = firstNameTextField.text,
          firstName.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the firstName"
            return
            
          }
    
    
    guard let lastName = lastNameTextField.text,
          lastName.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Enter the lastName"
            return
          }
    
    guard let weight = weightTextField.text,
          weight.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the weight"
            
            return
          }
    
    guard let height = heightTextField.text,
          height.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the height"
            
            return
          }
    
    guard let dateOfBirth = dateOfBirthTextField.text,
          dateOfBirth.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the date"
            
            return
          }
    FSUserManager.shared.signUpUserWith(email: email,
                                           password: password,
                                        firstname: firstName,
                                        lastname: lastName,
                                        Height:height,
                                        weight:weight
                                        ,DateOfBirth:dateOfBirth) { error in
      if error == nil {
        // Navigation
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storybord.instantiateViewController(withIdentifier: "HomeSignUp")
        
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
        
      } else {
        self.errorLabel.isHidden = false
        self.errorLabel.text = error?.localizedDescription
      }
    }
  }
}
