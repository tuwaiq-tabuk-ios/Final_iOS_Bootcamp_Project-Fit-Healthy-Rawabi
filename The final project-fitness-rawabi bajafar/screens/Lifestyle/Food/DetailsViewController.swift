//
//  DetailsViewController.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 14/05/1443 AH.
//

import UIKit
import Firebase

class DetailsViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet var FoodNameLabel: UILabel!
  
  @IBOutlet var FoodImageView: UIImageView!
  
  @IBOutlet var IngredientsLabel: UILabel!
  
  @IBOutlet var DescriptionLabel: UILabel!
  
  
  
  // MARK: - Properties
  
  var listOfFood = [""]
  var foodDictionary: [String] = [""]
  var food: Food!
  
  
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    //getSpotsData()
    
    FoodNameLabel.text = food.name
    FoodImageView.image = food.image
    IngredientsLabel.text = food.ingredients.joined(separator: "\n")
    DescriptionLabel.text = food.desc
    
    // Do any additional setup after loading the view.
  }
  
  
}



