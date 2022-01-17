//
//  genderVC.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 13/05/1443 AH.
//

import UIKit

class GenderVC: UIViewController {
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.backButtonTitle = ""
    
    overrideUserInterfaceStyle = .light
    
    navigationItem.setHidesBackButton(true, animated: true)
    
    
  }
}
