//
//  DetailsViewController.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 14/05/1443 AH.
//

import UIKit

class DetailsViewController: UIViewController {
  
  // MARK: - Properties
  
//  var listOfFood = [""]
//  var foodDictionary: [String] = [""]
  var food: Food!
  
  
  
  // MARK: - IBOutlets
  
  @IBOutlet var foodNameLabel: UILabel!
  
  @IBOutlet var foodImageView: UIImageView!
  
  @IBOutlet var ingredientsLabel: UILabel!
  
  @IBOutlet var descriptionLabel: UILabel!
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    //getSpotsData()
   
    print("\nDEBUG: \("#function") - \(String(describing: food))")
    print("\nDEBUG: \("#function") - \(String(describing: food.name))")
    foodNameLabel.text = food.name
    foodImageView.image = food.image
    ingredientsLabel.text = food.ingredients.joined(separator: "\n")
    descriptionLabel.text = food.desc
    
    // Do any additional setup after loading the view.
  }
  
}



