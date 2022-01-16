//
//  ItemsVC.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 09/06/1443 AH.
//

import Foundation
import UIKit
import Firebase

class ItemsVC: UITableViewController {
  
  // MARK: - Properties
  
  var itemStore: ItemStore!
  var imageStore: ImageStore!
  
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 65
    
    navigationItem.backButtonTitle = ""
    
  }
  
  
  
  // MARK: - @IBAction
  
  @IBAction func addNewItem(_ sender: UIBarButtonItem) {
    
    // Create a new item and add it to the store
    let newItem = ItemStore.createItem()
    // Figure out where that item is in the array
    if let index = ItemStore.allItems.firstIndex(of: newItem) {
      let indexPath = IndexPath(row: index, section: 0)
      // Insert this new row into the table
      tableView.insertRows(at: [indexPath], with: .automatic)
    }
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    navigationItem.leftBarButtonItem = editButtonItem
  }
  
  
  
  // MARK: - Methods
  
  func isBiggerThan50(value: Int)
  -> Bool{
    if(value > 50){
      return true
    }
    return false
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    
    return ItemStore.allItems.count
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // If the triggered segue is the "showItem" segue
    switch segue.identifier {
    case "showItem":
      // Figure out which row was just tapped
      if let row = tableView.indexPathForSelectedRow?.row {
        // Get the item associated with this row and pass it along
        let item = ItemStore.allItems[row]
        let detailViewController
        = segue.destination as! DetailViewController
        detailViewController.item = item
        detailViewController.imageStore = imageStore
      } default:
      preconditionFailure("Unexpected segue identifier.")
    }
  }
  
  
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",for: indexPath ) as! ItemCell
    let item = ItemStore.allItems[indexPath.row]
    return cell
    
  }
  
  override func tableView(_ tableView: UITableView,
                          commit editingStyle: UITableViewCell.EditingStyle,
                          forRowAt indexPath: IndexPath) {
    // If the table view is asking to commit a delete command...
    if editingStyle == .delete {
      let item = ItemStore.allItems[indexPath.row]
      // Remove the item from the store
      ItemStore.removeItem(item)
      
      // Remove the item's image from the image store
      ImageStore.deleteImage(forKey: item.id)
      // Also remove that row from the table view with an animation
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
  
  
  override func tableView(_ tableView: UITableView,
                          moveRowAt sourceIndexPath: IndexPath,
                          // Update the model
                          to destinationIndexPath: IndexPath) {
    ItemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
  }
  
  override func tableView(_ tableView: UITableView,
                          contextMenuConfigurationForRowAt indexPath: IndexPath,
                          point: CGPoint) -> UIContextMenuConfiguration? {
    
    let favorite = UIAction(title: "Favorite",
                            image: UIImage(systemName: "heart")) { _ in }
    
    let delete = UIAction(title: "Delete",
                          image: UIImage(systemName: "trash"),
                          attributes: [.destructive]) { _ in
      // Perform action
      
    }
    return UIContextMenuConfiguration(identifier: nil,
                                      previewProvider: nil) { _ in
      UIMenu(children: [favorite, delete])
    }
  }
}

