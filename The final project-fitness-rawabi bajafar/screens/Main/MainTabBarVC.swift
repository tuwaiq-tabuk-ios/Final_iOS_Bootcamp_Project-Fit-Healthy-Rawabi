//
//  TabBarVC.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 17/05/1443 AH.
//

import UIKit

class MainTabBarVC: UITabBarController {
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    // Do any additional setup after loading the view.
  }
  
}
