//
//  DetailsViewController.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 14/05/1443 AH.
//

import UIKit
import Firebase

class DetailsViewController: UIViewController {

  @IBOutlet var FoodNameLabel: UILabel!
  @IBOutlet var FoodImageView: UIImageView!
  
  @IBOutlet var IngredientsLabel: UILabel!
  @IBOutlet var DescriptionLabel: UILabel!
  
  var listOfFood = [""]
 
  var foodDictionary: [String] = [""]
  var food: Food!
 
  override func viewDidLoad() {
        super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    //getSpotsData()
    
    FoodNameLabel.text = food.name
    FoodImageView.image = food.image
    IngredientsLabel.text = food.ingredients.joined(separator: "\n")
    DescriptionLabel.text = food.desc
    
    // Do any additional setup after loading the view.
    }
  
// func getSpotsData() {
//  let db = Firestore.firestore()
//
//  db.collection("recipes").getDocuments() { (querySnapshot, err) in
//    if let err = err {
//      print("Error getting documents: \(err)")
//    } else {
//      for document in querySnapshot!.documents {
//       print("***********\n\n\n\(document.documentID) => \(document.data())")
//       print("******\n\n\n")
////       print(document.data()["name"]!)
//       self.listOfFood.append(document.data()["name"] as! String)
////       print("\n\nThis is the listArray:\(self.listArray)")
//      }
//    }
  }


// }
//
//}
