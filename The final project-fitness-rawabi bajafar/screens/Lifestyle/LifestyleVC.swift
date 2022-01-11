//
//  Measurements.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 17/05/1443 AH.
//


import Foundation
import UIKit
import Firebase
import FirebaseFirestore


class LifestyleVC: UIViewController {
  
  @IBOutlet var weight: UITextField!
  @IBOutlet var Height: UITextField!
  @IBOutlet var Age: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  //  let db = Firestore.firestore()
  //  db.collection("users").addDocument(data: ["Weight" : weight , "Height" : Height , "Age" : Age , "uid": result!.user.uid])
  //
  //
  @IBAction func atHome(_ sender: Any) {
    let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC")
    if let viewVC = vc {
      present(viewVC, animated: true, completion: nil)
    }
  }
  
  @IBAction func active(_ sender: Any) {
    
    let vct = storyboard?.instantiateViewController(withIdentifier: "HomeVC")
    if let viewVCt = vct {
      present(viewVCt, animated: true, completion: nil)
    }
  }
  
  @IBAction func atOffice(_ sender: Any) {
    
    let vctt = storyboard?.instantiateViewController(withIdentifier: "HomeVC")
    if let viewVCtt = vctt {
      present(viewVCtt, animated: true, completion: nil)
    }
  }
  
  
  @IBAction func movement(_ sender: Any) {
    let vcttt = storyboard?.instantiateViewController(withIdentifier: "HomeVC")
    if let viewVCttt = vcttt {
      present(viewVCttt, animated: true, completion: nil)
    }
  }
  
  
  @IBAction func lifestyle(_ sender: Any) {
    
    let vc1 = storyboard?.instantiateViewController(withIdentifier: "HomeVC")
    if let viewVC1 = vc1 {
      present(viewVC1, animated: true, completion: nil)
      
    }
    
  }
  
}
