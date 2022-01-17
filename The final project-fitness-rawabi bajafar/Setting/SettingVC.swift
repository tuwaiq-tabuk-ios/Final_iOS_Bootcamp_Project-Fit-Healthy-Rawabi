//
//  

import UIKit
import Firebase


class SettingVC: UIViewController{
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var updatePassBtn: UIButton!
  
  @IBOutlet weak var profile: UIButton!
  
  @IBOutlet weak var signOut: UIButton!
  
  @IBOutlet var Delete: UIButton!
  
  
  // MARK: - Properties
  
  var Users1: Users?
  
  let db = Firestore.firestore()
  
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.backButtonTitle = ""
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  
  
  // MARK: - @IBAction
  
  @IBAction func editeProfile(_ sender: Any) {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "profile") as! ProfileVC
    self.present(nextViewController, animated:true, completion:nil)
    
  }
  
  @IBAction func editePassword(_ sender: Any) {
    
    let vc3 = storyboard?.instantiateViewController(withIdentifier: "Password")
    
    
    if let viewController1 = vc3 {
      navigationController?.pushViewController(viewController1, animated: true)
      
    }
    
    
  }
  
  @IBAction func DeleteAccount(_ sender: Any) {
    let user = Auth.auth().currentUser
    user?.delete() { error in
      if let error = error {
        print("******** \(error)")
      } else {
        print("Account Deleted")
      }
      
    }
  }
  
  @IBAction func SignOut(_ sender: UIBarButtonItem) {
    
    
    do{
      try Auth.auth().signOut()
      self.navigationController?.popViewController(animated: true)
    }catch{print("Error")}
    
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "signOutSegue") as! ExerciseVC
    self.present(nextViewController, animated:true, completion:nil)
    
  }
}
