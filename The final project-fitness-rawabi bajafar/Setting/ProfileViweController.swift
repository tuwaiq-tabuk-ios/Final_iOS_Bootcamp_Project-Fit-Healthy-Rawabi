//
//  


import UIKit
import Firebase
import FirebaseFirestore

class ProfileViweController: UIViewController  {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var EmailTF:CMTextField!
  
  @IBOutlet var firstnameTF: CMTextField!
  
  @IBOutlet var lastnameTF: CMTextField!
  
  @IBOutlet var weightTF: CMTextField!
  
  @IBOutlet var heightTF: CMTextField!
  
  @IBOutlet weak var sendBtn: UIButton!
  
  @IBOutlet var dateOfBirthTF: CMTextField!
  
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  
  var firstName = "firstname"
  var lastName = "lastname"
  var weight = "weight"
  var height = "Height"
  var dataOfBirth =  "DateOfBirth"
  var email = ""
  
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
   
    
    let user = Auth.auth().currentUser
    print(user?.uid)
    if let currentUser = user {
      db.collection("users").document(currentUser.uid).getDocument { doc, err in
        if err != nil{
          print(err)
          
        }
        else {
          let data = doc!.data()!
          self.firstName = data ["firstname"] as! String
          self.lastName = data ["lastname"] as! String
          self.weight = data ["weight"] as! String
          self.height = data ["height"] as! String
          self.dataOfBirth = data ["DateOfBirth"] as! String
          self.email = (user?.email)!
          print("\n\n\n************The DATA::\(data)")
          
          self.firstnameTF.text = self.firstName
          self.lastnameTF.text = self.lastName
          self.weightTF.text = self.weight
          self.heightTF.text = self.height
          self.dateOfBirthTF.text = self.dataOfBirth
          self.EmailTF.text = self.email
          
        }
      }
    }
  }
  
  
  
  // MARK: - @IBAction
  
  @IBAction func sendProfile(_ sender: Any) {
    Auth.auth().currentUser?.updateEmail(to: EmailTF.text!) { [self] error in
      if error == nil{
        let ref = db.collection("users").document(Auth.auth().currentUser!.uid)
        ref.updateData(["email": EmailTF.text!]) { err in
          if let err = err {
            print("Error updating document: \(err)")
          } else {
            print("Document successfully updated")
          }
        }
        
      }
    }
    
    
    self.firstName = self.firstnameTF.text!
    self.lastName = self.lastnameTF.text!
    self.weight = self.weightTF.text!
    self.height = self.heightTF.text!
    self.dataOfBirth = self.dateOfBirthTF.text!
    
    db.collection("users").document(Auth.auth().currentUser!.uid).updateData([
      "firstname": self.firstName, "lastname": self.lastName,"weight":self.weight,"height":self.height,"DateOfBirth":self.dataOfBirth])
    { err in
      if let err = err {
        print("\n\n\n*******Error updating document: \(err)")
      } else {
        print("\n\n\n*******Document successfully updated")
      }
    }
    
    
  }
}
