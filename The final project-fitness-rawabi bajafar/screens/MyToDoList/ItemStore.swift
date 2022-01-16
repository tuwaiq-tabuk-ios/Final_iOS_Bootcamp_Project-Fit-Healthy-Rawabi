//
//  ItemStore.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 09/06/1443 AH.
//

import Foundation
import UIKit


class ItemStore {
  
  // MARK: - Properties
  
  static  var allItems = [Item]()
  
  let itemArchiveURL: URL = {
    let documentsDirectories =
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentDirectory = documentsDirectories.first!
    return documentDirectory.appendingPathComponent("items.plist")
  }()
  
  init() {
    let notificationCenter = NotificationCenter.default
    notificationCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
  }
  
  
  
  
  // MARK: - Methods
  
  @objc func saveChanges () {
    do {
      try ItemStore.allItems.count
    } catch Error.encodingError {
      print("Couldn't encode items.")
    } catch Error.writingError {
      print("Couldn't write to file.")
    } catch (let error){
      print("Error: \(error)")
    }
  }
  
  
  // Archive changes
  func archiveChanges () throws {
    print("Saving items to: \(itemArchiveURL)")
    let encoder = PropertyListEncoder()
    
    guard let data = try? encoder.encode(ItemStore.allItems) else {
      throw ItemStore.Error.encodingError
    }
    
    guard let _ = try? data.write(to: itemArchiveURL, options: [.atomic]) else {
      throw ItemStore.Error.writingError
    }
    print ("Saved all of the items")
  }
  
  
  
  @discardableResult static func createItem() -> Item {
    let newItem = Item(random: true)
    
    ItemStore.allItems.append(newItem)
    
    return newItem
  }
  
  
  static  func removeItem(_ item: Item) {
    if let index = ItemStore.allItems.firstIndex(of: item) {
      ItemStore.allItems.remove(at: index)
    }
  }
  
  
  static  func moveItem(from fromIndex: Int, to toIndex: Int) {
    if fromIndex == toIndex {
      return }
    // Get reference to object being moved so you can reinsert it
    let movedItem = ItemStore.allItems[fromIndex]
    // Remove item from array
    ItemStore.allItems.remove(at: fromIndex)
    // Insert item in array at new location
    ItemStore.allItems.insert(movedItem, at: toIndex)
  }
  
  enum Error: Swift.Error {
    case encodingError
    case writingError
    case mysteriousError
  }
  
}
