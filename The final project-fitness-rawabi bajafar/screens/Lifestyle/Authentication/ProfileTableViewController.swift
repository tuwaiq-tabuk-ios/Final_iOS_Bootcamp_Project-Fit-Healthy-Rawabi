//
//  ProfileTableViewController.swift
// 

import UIKit

class ProfileTableViewController: UITableViewController {
  
  // MARK: - View controller lifecycle
  
  let ProfileItems: [LifestyleItem] = [
    LifestyleItem(name: "Account", description: "Description item 0"),
    LifestyleItem(name: "Password", description: "Description item 1"),
    LifestyleItem(name: "Phone number", description: "Description item 2"), LifestyleItem(name: "Language", description: "Description item 3"),
    LifestyleItem(name: "Username", description: "Description item 3")
  ]
  
  var currentDescription: String = ""
  
  
  
  // MARK: - @IBAction
  
  @IBOutlet weak var avatarImageView: AvatarImageView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    
    avatarImageView.layer.masksToBounds = false
    avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
    avatarImageView.clipsToBounds = true
    avatarImageView.tintColor = .systemGray5
    
    setDefaultAvatar()
    setupContextMenu()
  }
  
  // MARK: - Table view data source
  
  private func setupContextMenu() {
    let interaction = UIContextMenuInteraction(delegate: self)
    avatarImageView.isUserInteractionEnabled = true
    avatarImageView.addInteraction(interaction)
  }
  
  private func selectAvatar(){
    let imagePicker = UIImagePickerController()
    imagePicker.allowsEditing = true
    imagePicker.delegate = self
    present(imagePicker, animated: true, completion: nil)
  }
  
  private func setDefaultAvatar() {
    avatarImageView.image = UIImage(named: "User Circle")
  }
  
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return ProfileItems.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reusable_cell", for: indexPath)
    
    // Configure the cell...
    cell.textLabel?.text = ProfileItems[indexPath.row].name
    return cell
  }
  
  
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    currentDescription = ProfileItems[indexPath.row].description
    performSegue(withIdentifier: "show_detail", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    if let destinationVC = segue.destination as? DetailVC {
      destinationVC.descriptionText = currentDescription
    }
  }
}



// MARK: - Navigation

extension ProfileTableViewController : UIContextMenuInteractionDelegate {
  
  func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
                              previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) ->
  UITargetedPreview? {
    let params = UIPreviewParameters()
    params.backgroundColor = .clear
    let preview = UITargetedPreview(view: avatarImageView, parameters: params)
    return preview
  }
  
  
  
  // MARK: - Methods
  
  func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
    
    guard interaction.view === avatarImageView else { return nil }
    
    return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (suggestedActions) -> UIMenu? in
      let chooseAvatar = UIAction(title: "Choose Avatar", image: UIImage(systemName: "pencil"), identifier:
                                    nil) { _ in
        self.selectAvatar()
      }
      
      let removeAvatar = UIAction(title: "Remove", image: UIImage(systemName: "trash"), identifier: nil,
                                  attributes: [.destructive]) { _ in
        self.setDefaultAvatar()
      }
      return UIMenu(title: "Avatar", image: nil, identifier: nil, options: [], children: [
        chooseAvatar,removeAvatar
      ])
    }
  }
  
}




// MARK: - Navigation

extension ProfileTableViewController:UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
  
  func imagePickerControllerDidCancel(_picker:UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage {
      avatarImageView.image = image
    }
    dismiss(animated: true , completion: nil)
  }
}
