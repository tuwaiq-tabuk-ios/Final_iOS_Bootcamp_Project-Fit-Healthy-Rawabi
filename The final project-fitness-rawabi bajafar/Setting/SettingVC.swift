//
//  SettingVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
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
    //self.navigationController?.pushViewController(nextViewController, animated: true)
    
    
//    UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "signOutSegue") as! ExerciseVC
//    self.present(nextViewController, animated:true, completion:nil)

          
  
  
    
   
          
          
    
    
    
    
    
    
    
//          //performSegue(withIdentifier: "signOutSegue", sender: nil)
//
//
//          let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "signOutSegue") as! ExerciseVC
//          //self.navigationController(nextViewController, animated:true, completion:nil)
//          navigationController?.pushViewController(nextViewController, animated: true)
//
//        } catch {
//          print(error)
//        }
//    func logoutUser() {
//        // call from any screen
//        
//        do { try Auth.auth().signOut() }
//        catch { print("already logged out") }
//        
//        navigationController?.popToRootViewController(animated: true)
//    
//    }



    

    
    //    let vc4 = storyboard?.instantiateViewController(withIdentifier: "Exercise")
//        if let viewController12 = vc4 {
//        navigationController?.pushViewController(viewController12, animated: true)
//          let firebaseAuth = Auth.auth()
//              do {
//                try firebaseAuth.signOut()
//                self.navigationController?.popToRootViewController(animated: true)
//                print("signOut")
//              } catch let signOutError as NSError {
//                print("Error signing out: %@", signOutError)
//
//        }
//
//  }
  // let viewController = self.storyboard?.instantiateViewController(withIdentifier: "profile") as! ProfileVC

 
    //logout
//    let vc = storyboard?.instantiateViewController(withIdentifier: "ExerciseVC")
//   if let viewcontroller4 = vc {
//      //viewcontroller4.User
//      navigationController?.pushViewController(viewcontroller4, animated: true)
//  }
  
//    let firebaseAuth = Auth.auth()
//    do {
//      try firebaseAuth.signOut()
//      self.navigationController?.popToRootViewController(animated: true)
//      print("signOut")
//    } catch let signOutError as NSError {
//      print("Error signing out: %@", signOutError)


}
}
