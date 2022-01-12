//
//  ForgotPasswordVC.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 24/05/1443 AH.
//

import Foundation

import UIKit
class ForgotPasswordVC: UIViewController{
  
  
  @IBOutlet var emilContainerView: UIView!
  @IBOutlet var emilTextField: UITextField!
  
  @IBOutlet var restButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.backButtonTitle = ""
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  
  
}
