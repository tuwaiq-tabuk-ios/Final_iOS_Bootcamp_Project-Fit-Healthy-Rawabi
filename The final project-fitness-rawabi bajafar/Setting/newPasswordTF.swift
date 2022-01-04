
import UIKit
import Firebase
import FirebaseFirestore

class newPasswordTF : UIViewController {
  let db = Firestore.firestore()
 
  @IBOutlet var newPasswordTF: MainTF!
  @IBOutlet weak var saveBotn: UIButton!
  
  var Password = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let user =  Auth.auth().currentUser
    print(user?.uid)
    if let currentUser = user {
      db.collection("users").document(currentUser.uid).getDocument { doc, err in
        if err != nil{
          print(err)
          
        }
        else{
          let data = doc!.data()!
          
        
        
          self.newPasswordTF.text = self.Password
      }
    }
  }
}

  @IBAction func newPassword(_ sender: Any) {
    Auth.auth().currentUser?.updatePassword(to: newPasswordTF.text!) { [self] error in
      if error == nil{
        let ref = db.collection("users").document(Auth.auth().currentUser!.uid)
        ref.updateData(["password": newPasswordTF.text!]) { err in
          if let err = err {
            print("Error updating document: \(err)")
          } else {
            print("Document successfully updated")
          }
        }
        
      }
    }
  }
  
}
