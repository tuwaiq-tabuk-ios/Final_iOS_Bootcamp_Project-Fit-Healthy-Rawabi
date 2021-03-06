//
// 
import Foundation
import UIKit

class Utilities {
  
  static func styleTextField(_ textfield:UITextField) {
    
    // Create the bottom line
    let bottomLine = CALayer()
    
    bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2,
                              width: textfield.frame.width,
                              height: 2)
    
    
    bottomLine.backgroundColor = UIColor(named: "Gray")?.cgColor
    
    textfield.borderStyle = .none
    
    // Add the line to the text field
    textfield.layer.addSublayer(bottomLine)
  }
  
  
  static func styleFilledButton(_ button:UIButton) {
    
    
    //stySignUp
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.cornerRadius = 25.0
    button.tintColor = UIColor.black
    //text
    
    
  }
  
  static func styleHollowButton(_ button:UIButton) {
    //styLogin
    // Hollow rounded corner style
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.cornerRadius = 25.0
    button.tintColor = UIColor.black
    
  }
  
  
  static func isPasswordValid(_ password : String) -> Bool {
    
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&_])[A-Za-z\\d$@$#!%*?&_]{8,}")
    return passwordTest.evaluate(with: password)
  }
  
}
