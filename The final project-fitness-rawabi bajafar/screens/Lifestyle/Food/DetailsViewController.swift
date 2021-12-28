//
//  DetailsViewController.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 14/05/1443 AH.
//

import UIKit

class DetailsViewController: UIViewController {

  @IBOutlet var FoodNameLabel: UILabel!
  @IBOutlet var FoodImageView: UIImageView!
  
  @IBOutlet var IngredientsLabel: UILabel!
  @IBOutlet var DescriptionLabel: UILabel!
  
  
  var food: Food!
 
  override func viewDidLoad() {
        super.viewDidLoad()
    
    
    FoodNameLabel.text = food.name
    FoodImageView.image = food.image
    IngredientsLabel.text = food.ingredients.joined(separator: "\n")
    DescriptionLabel.text = food.desc
    
    // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
