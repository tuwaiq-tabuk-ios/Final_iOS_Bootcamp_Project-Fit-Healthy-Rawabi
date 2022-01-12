//
//  

import UIKit
import Firebase


class SettingVC: UIViewController{
  
  
  
  @IBOutlet weak var updatePassBtn: UIButton!
  @IBOutlet weak var profile: UIButton!
  @IBOutlet weak var signOut: UIButton!
  
  var Users1: Users?
  
  
  
  let db = Firestore.firestore()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.backButtonTitle = ""
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
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
