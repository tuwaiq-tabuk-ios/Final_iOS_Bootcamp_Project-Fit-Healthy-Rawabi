//
//  FoodViewController.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 14/05/1443 AH.
//

import UIKit

class FoodViewController: UIViewController{
 var array =  [
  Food(name: "breakfast", image: UIImage(named: "breakfast"), desc: "Ingredients,1 tablespoon butter, 1 tablespoon vegetable oil ,3 hard-boiled eggs ,1 onion chopped, 2 finely chopped tomatoes, 2 cloves minced garlic,1 hot green pepper (or bell pepper), chopped, 1 teaspoon salt,½ teaspoon paprika, ½ teaspoon dried thyme, pinch of black pepper,To decorate:,½ cup shredded mozzarella  Pinch of hot red pepper,pinch dried thyme ,How to prepare Boil the eggs, cut them in half and set them aside. Put the butter and oil in a non-stick frying pan and melt the butter, then add the onions and stir until they soften a little After the onions wilt, add the tomatoes and stir, then add the garlic and green pepper and stir well. Cover the ingredients and leave them on a medium to low heat until the vegetables are wilted. Remove the lid and add the spices i.e. salt, pepper, paprika and dried thyme and stir until well mixed with the ingredients. Arrange the boiled eggs on top of the vegetables and add mozzarella, hot red pepper and dried thyme on top. Cover the pan and leave it until the cheese melts, so the dish is ready to be served. "),
  
  Food(name: "lunch", image: UIImage(named: "lunch"), desc: "200 grams chicken fillet, cut into squares olive oil 200 grams of boiled rice with boiling water, salt and wholesome spices (Clove, Cardamom, Cinnamon) only.  Can you add a few mixed vegetables? Spices: mashed garlic ginger paste or fresh ginger  curry mr cuminm  paprika Salt and black pepper Marinate the chicken with all the spices and a spoonful of olive oil A frying pan on the fire, add the chicken and stir until it is cooked Serve it with rice and a plate of salad") ,
  
  Food(name: "Snack", image: UIImage(named: "Snack"), desc: "2 apples 2 oranges 2 cucumbers 1 carrot cherry kernels grapes 2 bananas Lemon sumac Wash the fruits well and chop Add lemon and sumac only and serve"),
 
  Food(name: "dinner", image: UIImage(named: "dinner"), desc: "A kilo of chicken breasts and onions ½ piece of each color bell pepper Garlic 4 cloves minced minced gingerHot pepper slices, sliced½ teaspoon black pepper A tablespoon of sweet paprik ½ teaspoon white peppers ½teaspoon cumin ½ teaspoon coriander full.    teaspoon salt ¼ teaspoon cinnamonOil spray from 2 to 4 sprays Wash the chicken with vinegar, salt and lemon to exhale and marinate for 20 minutes in the vinegar Cut the onions and bell peppers into slices and chop the garlic and ginger Rinse the chicken and cut it into slices We spray from 2 to 4 sprays of oil and put the onions with garlic and ginger so that the spices are in a clean center with the koshnah. Put the chicken in the pot and flip it until it changes color, a simple thing and add the spices.  I added it early so that it does not wither once and add a little water and salt") ,
 ]
  
  @IBOutlet var healthyFood: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    healthyFood.dataSource = self
    healthyFood.delegate = self
  }
  
}


extension FoodViewController: UITableViewDataSource , UITableViewDelegate{

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodCell
    
    let currentFood = array[indexPath.row]
    cell.FoodNameLabel.text = currentFood.name
    cell.FoodImageView.image = currentFood.image
    cell.FoodImageView.layer.cornerRadius = cell.FoodImageView.frame.width/2
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 118
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let Food = array[indexPath.row]
    print(Food.name)
   let vc =  storyboard?.instantiateViewController(withIdentifier: "detailsVC") as? DetailsViewController
    
   
   
    if let viewController = vc {
      viewController.food = Food
      present(viewController, animated: true, completion: nil)
    }
   
  
  }

}
