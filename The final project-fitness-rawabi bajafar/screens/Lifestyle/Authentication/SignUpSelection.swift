//
//  SignUpSelection.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 17/05/1443 AH.
//

import Foundation
import UIKit

class SignUpSelection: UIViewController {
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    navigationItem.backButtonTitle = ""
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  
  
  // MARK: - @IBAction
  
  
  @IBAction func FemaleButton(_ sender: Any) {
    
    let vcc = storyboard?.instantiateViewController(withIdentifier: "Lifestyle")
    
    if let viewcontroller = vcc{
      present(viewcontroller, animated: true, completion: nil)
    }
  }
  @IBAction func MaleButton(_ sender: Any) {
    
    let vccc = storyboard?.instantiateViewController(withIdentifier: "Lifestyle")
    
    if let viewcontrollerr = vccc{
      
      
      present(viewcontrollerr, animated: true, completion: nil)
      
    }
  }
  
}
