//
//  File.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 06/06/1443 AH.
//


import UIKit

extension UIViewController {
  func Keyboard() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc private func dismissKeyboardTouchOutside() {
    view.endEditing(true)
  }
}
