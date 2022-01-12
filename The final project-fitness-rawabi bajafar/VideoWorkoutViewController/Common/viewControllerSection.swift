//
//  ViewController.swift
//  final project 2
//
//  Created by Bushra alatwi on 24/04/1443 AH.
//

import UIKit
struct Section {
  let title: String
  let options: [SettingsOption]
}
struct SettingsOption {
  let title: String
  let icon: UIImage
  let iconBackgroundColor: UIColor
  let handler: (() -> Void)
}

class viewControllerSection: UIViewController, UITableViewDelegate,UITableViewDataSource {
  @IBOutlet var profile: UIButton!
  
  
  
  private let tableView: UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
    return table
  }()
  
  var models = [Section]()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    configure()
    title = "Account Setting"
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.frame = view.bounds
    
    creatButton()
  }
  
  var goButton = UIButton()
  
  func creatButton() {
    goButton.setTitle("Sign Out", for: .normal)
    goButton.setTitleColor(UIColor.black, for: .normal)
    goButton.backgroundColor = UIColor.lightText
    goButton.layer.cornerRadius = 25
    
    goButton.frame = CGRect(x: view.frame.width/2 - 100, y: 644, width: 200, height: 50)
    view.addSubview(goButton)
  }
  
  func configure(){
    models.append(Section(title: "Account Setting", options:
                            
                            [SettingsOption(title: "profile", icon:UIImage(systemName: "person")!,iconBackgroundColor:.systemGray2){
      
    },
                             SettingsOption(title: "language", icon: UIImage(systemName: "globe")!, iconBackgroundColor: .systemGray2){
      print("Tapped first cell")
    },
                             
                             
                             SettingsOption(title: "Update mobile number", icon: UIImage(systemName: "iphone")!, iconBackgroundColor: .systemGray2) {
    },
                             SettingsOption(title: "Change Password", icon: UIImage(systemName: "lock")!, iconBackgroundColor: .systemGray2) {
    },
                             SettingsOption(title:"help",icon: UIImage(systemName: "wrench")!, iconBackgroundColor: .systemGray2){
      
    }
                            ]))
  }
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let section = models[section]
    return section.title
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models[section].options.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let model = models[indexPath.section].options[indexPath.row]
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath)
            as? SettingTableViewCell else{
              return UITableViewCell()
            }
    cell.configure(with: model)
    return cell
  }
  
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let model = models[indexPath.section].options[indexPath.row]
    model.handler()
    
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
    
    
  }
  
  
}

