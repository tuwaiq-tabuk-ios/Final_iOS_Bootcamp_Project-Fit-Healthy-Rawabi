//
//  FoodCell.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 14/05/1443 AH.
//

import UIKit

class FoodCell: UITableViewCell {
  
  // MARK: - IBOutlets
  
  @IBOutlet var FoodImageView: UIImageView!
  
  @IBOutlet var FoodNameLabel: UILabel!
  
  
  
  // MARK: - View controller lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
