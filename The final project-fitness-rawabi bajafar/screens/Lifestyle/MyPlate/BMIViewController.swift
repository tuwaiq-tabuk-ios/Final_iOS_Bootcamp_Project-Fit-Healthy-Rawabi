//
//  

import UIKit
//import CoreData

class BMIViewController: UIViewController {
  
  // MARK: - Properties
  
  var origWidth:CGFloat = 0.0;
  var origHeight:CGFloat = 0.0;
  var weightbody = "weight"
  var heightbody =  "height"
  
  
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var bmiGraphImageView: UIImageView!
  
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    self.hideKeyboardWhenTappedAround()
    bmiGraphImageView.image = UIImage(named: "boysChart")
    origWidth = bmiGraphImageView.frame.width;
    origHeight = bmiGraphImageView.frame.height;
    // Do any additional setup after loading the view.
    
  }
  
  
  
  // MARK: - @IBAction
  
  @IBAction func handlePinch(recognizer : UIPinchGestureRecognizer)  {
    if let view = recognizer.view {
      
      view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
      recognizer.scale = 1
    }
  }
  
  @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: self.view)
    if let view = recognizer.view {
      view.center = CGPoint(x:view.center.x + translation.x,
                            y:view.center.y + translation.y)
    }
    recognizer.setTranslation(CGPoint.zero, in: self.view)
  }
  
  
  
  // MARK: - View controller lifecycle
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  // MARK: - Properties
  
  var imperial:Bool = true;
  var male:Bool = true;
  
  
  
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var measurementSegmentedControl: UISegmentedControl!
  
  @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
  
  @IBOutlet weak var heightTextField: UITextField!
  
  @IBOutlet weak var weightTextField: UITextField!
  
  @IBOutlet weak var ageTextField: UITextField!
  
  @IBOutlet weak var calculateButton: UIButton!
  
  @IBOutlet weak var showBMILabel: UILabel!
  
  @IBAction func measurementSegmentedControlChanged(_ sender: Any) {
    
    
    
    
    imperial = !imperial;
    
    if (!imperial)
    {
      heightTextField.placeholder! = "(cm)";
      weightTextField.placeholder! = "(kg)";
    }
    else
    {
      heightTextField.placeholder! = "(in)";
      weightTextField.placeholder! = "(lbs)";
    }
    
  }
  
  
  
  // MARK: - @IBAction
  
  @IBAction func genderSegmentedControlChanged(_ sender: Any) {
    
    male = !male;
    
    if (male)
    {
      bmiGraphImageView.image = UIImage(named: "boysChart")
    }
    else
    {
      bmiGraphImageView.image = UIImage(named: "girlsChart")
    }
  }
  
  @IBAction func calculateBMIButtonPressed(_ sender: Any) {
    
    //if (!imperial)
    
    if ((heightTextField.text?.isEmpty)! || (weightTextField.text?.isEmpty)! || (ageTextField.text?.isEmpty)!)
    {
      return;
    }
    
    let heightString:String = heightTextField.text!
    let weightString:String = weightTextField.text!
    let ageString:String = ageTextField.text!
    
    /*
     if (CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: heightString)) && CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: weightString)) && CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: ageString)))
     
     */
    //{
    var heightFloat:Float = Float(heightString)!
    if (!imperial)
    {
      heightFloat = heightFloat / 100
    }
    let weightFloat:Float = Float(weightString)!
    let ageFloat:Float = Float(weightString)!
    
    print (weightFloat, heightFloat)
    
    var BMI:Float = Float(weightFloat / ((heightFloat) * (heightFloat)))
    if (imperial)
    {
      BMI = BMI * 703
    }
    showBMILabel.text = String(BMI)
    
  }
  
  
  
  
  @IBAction func saveBMIPressed(_ sender: Any) {
    
    let date = Date()
    let calendar = Calendar.current
    let year = String(calendar.component(.year, from: date))
    let month = String(calendar.component(.month, from: date))
    let day = String(calendar.component(.day, from: date))
    let hour = String(calendar.component(.hour, from: date))
    let minutes = String(calendar.component(.minute, from: date))
    
    var timeString:String = (month + "/" + day + "/" + year + " at " + hour + ":" + minutes);
    
    if ((showBMILabel.text?.isEmpty)!)
    {
      return;
    }
    else
    {
      let bmi = (showBMILabel.text!)
      
      if (bmi == "0.0")
      {
        print ("No real bmi here")
        return;
      }
      
      print (timeString)
      print (bmi)
      
      saveBMI(bmi: bmi, time: timeString)
    }
    
  }
  
  func saveBMI(bmi: String, time: String) {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    do {
      // try managedContext.save()
    } catch {
      let nserror = error as NSError
      NSLog("Unable to save \(nserror), \(nserror.userInfo)")
      abort()
    }
    
  }
  
}



// MARK: - Navigation

extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
