//
//  ViewController.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 28/05/1443 AH.
//

import UIKit
import Firebase
class WalkRunCycleVC: UIViewController {
  
  
  var workoutType: WorkoutType?
  var startDate: Date!
  var durationTimer: Timer! = nil
  var statusTimer: Bool? = false
  var duration = (hours: 0, minutes: 0, seconds: 0)
  //var pedometer = CMPedometer()
  
  var stepsCount: Int = 0
  
  var distanceUnit: String?
  @IBOutlet var walkRunCycleView: UIView!
  @IBOutlet var gettingStartedView: UIView!
  @IBOutlet weak var gettingReadyLabel: UILabel!
  
  @IBOutlet var mainCountingParameterUnitLabel: UILabel!
  var gettingReadyCount = 3
  
  @IBOutlet var durationLabel: UILabel!
  @IBOutlet var mainCountingParameterLabel: UILabel!
  
  @IBOutlet var secondaryCountingParameterTitleLabel: UILabel!
  
  @IBOutlet var secondaryCountingParameterUnitLabel: UILabel!
  
  @IBOutlet var secondaryCountingParameterLabel: UILabel!
  
  @IBOutlet var caloriesLabel: UILabel!
  
  @IBOutlet var paceLabel: UILabel!
  
  func getReady() {
    
    gettingStartedView.frame = view.frame
    
    walkRunCycleView.addSubview(gettingStartedView)
    
    let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
      DispatchQueue.main.async {
        self.gettingReadyLabel.text = "\(self.gettingReadyCount)"
      }
      
      self.gettingReadyCount = self.gettingReadyCount - 1
      
      if self.gettingReadyCount == 0 {
        DispatchQueue.main.async {
          let font = UIFont.systemFont(ofSize: 96)
          self.gettingReadyLabel.font = font
          self.gettingReadyLabel.text = "Ready"
        }
      }
    }
    
    
    
  }
  
  func setupRunPedometer() {
      
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let _ = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { timer in
        self.gettingStartedView.isHidden = true
        
    }
    
//    self.durationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(durationCounter), userInfo: nil, repeats: true)
    
}

    
  }
  
//  @IBAction func Pause(_ sender: Any) {
 // }
  
//}
