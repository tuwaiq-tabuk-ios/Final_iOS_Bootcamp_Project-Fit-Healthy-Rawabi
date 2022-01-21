//
//  HomeVC.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 25/05/1443 AH.
//

import UIKit

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
  // MARK: - IBOutlets
  
  @IBOutlet var PageController: UIPageControl!
  
  @IBOutlet var collectionView: UICollectionView!
  
  @IBOutlet var startWorkoutButton: UIButton!
  
  
  
  // MARK: - Properties
  
  var arrLabel = [
    
    UIImage(named: "FIT-1"),
    UIImage(named: "FIT5"),
    UIImage(named: "12-2"),
    UIImage(named: "11-2"),
    UIImage(named: "10]-2"),
    UIImage(named: "14-2")]
  
  var timer : Timer?
  var currentCollIndex = 0
  
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    PageController.numberOfPages = arrLabel.count
    
    startTimer()
    
    navigationItem.backButtonTitle = ""
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    // Do any additional setup after loading the view.
  }
  
  
  
  // MARK: - @IBAction
  
  @IBAction func startWorkoutButton(_ sender: Any) {
    print("Start Workout")
  }
  
  
  
  // MARK: - Methods
  
  func startTimer(){
    
    timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
  }
  
  @objc func moveToNextIndex() {
    if currentCollIndex < arrLabel.count - 1{
      currentCollIndex += 1
    } else {
      currentCollIndex = 0
    }
    
    
    collectionView.scrollToItem(at: IndexPath(item: currentCollIndex, section: 0), at: .centeredHorizontally, animated: true)
    
    PageController.currentPage = currentCollIndex
    
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrLabel.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
    cell.imageProduct.image = arrLabel[indexPath.row]
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
}
