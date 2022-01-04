//
//  


import UIKit
import Firebase
import FirebaseFirestore


class ProfileVC: UIViewController {
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var PhoneLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!
 
  var user = "firstname"
  var user1 = "lastname"
  var user2 = "weight"
  var user3 = "Height"
  var user4 =  "DateOfBirth"
  //var user = [Item]()
 // var employee = [Employee]()
  let db = Firestore.firestore()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //updateEmail.text = User.email
    
    //conerReduis()
    readUsers()
  }
  
  
  func readUsers(){
    if  let user = Auth.auth().currentUser?.uid{
      let docRef = db.collection("Users").document(user)
      
      docRef.getDocument { (document, error) in
        if let document = document, document.exists {
          let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
          self.nameLabel.text = document.data()?["name"] as? String
          self.emailLabel.text = document.data()?["email"] as? String
          self.PhoneLabel.text = document.data()?["phone"] as? String
        } else {
          print("Document does not exist\(error?.localizedDescription)")
        }
      }
      
    }
  }
  
}
