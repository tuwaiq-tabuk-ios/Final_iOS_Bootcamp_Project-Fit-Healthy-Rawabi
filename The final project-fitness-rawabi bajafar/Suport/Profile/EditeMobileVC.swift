

import UIKit
import Firebase
import FirebaseFirestore

class EditeMobileVC : UIViewController {
  
  
  @IBOutlet weak var newMobileTF: MainTF!
  @IBOutlet weak var saveBtn: UIButton!
  
var user :Item!

  let db = Firestore.firestore()
   override func viewDidLoad() {
     super.viewDidLoad()
    
   }

 @IBAction func updateDataPressed(_ sender: UIButton) {
   let washingtonRef = db.collection("Users").document()
    washingtonRef.updateData([
      "phone": newMobileTF.text!
    ]) { err in
      if let err = err {
        print("Error updating document: \(err)")
      } else {
        print("Document successfully updated")
      }
    }
   }
  }






