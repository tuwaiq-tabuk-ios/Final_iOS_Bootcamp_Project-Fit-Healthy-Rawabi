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
  
 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    


  

  }
  @IBAction func pause(_ sender: Any) {
  }


  @IBOutlet var End: UIStackView!
  
}
