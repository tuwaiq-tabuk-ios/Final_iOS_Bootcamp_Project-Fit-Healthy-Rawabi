//
//  WalkRunCycleViewController.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 27/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import Firebase
class WalkRunCycleViewController: UIViewController {
  
  let db = Firestore.firestore()
  
  var workoutType: WorkoutType?
  
  var startDate: Date!
  
  var durationTimer: Timer! = nil
  var statusTimer: Bool? = false
  var duration = (hours: 0, minutes: 0, seconds: 0)
  
  
  var stepsCount: Int = 0
  
  var distanceUnit: String?
  
  
  
  @IBOutlet var walkRunCycleView: UIView!
  
  @IBOutlet var gettingStartedView: UIView!
  
  @IBOutlet weak var gettingReadyLabel: UILabel!
  
  var gettingReadyCount = 3
  
  @IBOutlet var durationLabel: UILabel!
  
  @IBOutlet var mainCountingParameterLabel: UILabel!
  
  @IBOutlet var mainCountingParameterUnitLabel: UILabel!
  
  @IBOutlet var secondaryCountingParameterTitleLabel: UILabel!
  
  
  @IBOutlet var secondaryCountingParameterUnitLabel: UILabel!
  
  
  @IBOutlet var secondaryCountingParameterLabel: UILabel!
  
  @IBOutlet var paceLabel: UILabel!
  
  @IBOutlet var caloriesLabel: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
      
    }
 // let persistance = PersistanceService.shared
  
  
  
  
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
  
  func setupUI() {
      mainCountingParameterLabel.text = "0"
      durationLabel.text = String(format: "%.2d:%.2d:%.2d", duration.0, duration.1, duration.2)
      secondaryCountingParameterLabel.text = "----"
      caloriesLabel.text = "0"
      paceLabel.text = "-'--\""
      
     
      }
      
}

  
  func setupWalkPedometer() {
  
  }

    

  
