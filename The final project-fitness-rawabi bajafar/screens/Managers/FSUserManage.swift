//
//  FSUserManage.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 15/06/1443 AH.
//
//
import Foundation
import Firebase
 
class FSUserManager {
  static let shared = FSUserManager()
  
  private init() {}
  
  private var email: String = ""
  private var password: String = ""
  private var firstname: String = ""
  private var lastname: String = ""
  private  var Height: String = ""
  private  var weight: String = ""
  private var DateOfBirth: String = ""
  
  
  
  // MARK: - Register
  func signUpUserWith(
    email: String,
    password: String,
    firstname: String,
    lastname: String ,
    Height: String ,
    weight: String ,
   DateOfBirth: String ,
    
    completion: @escaping (_ error: Error?) -> Void
  ) {

    self.email = email
    self.password = password
    self.firstname = firstname
    self.lastname = lastname
    self.Height = Height
    self.weight = weight
    self.DateOfBirth = DateOfBirth
    

    Auth
      .auth()
      .createUser(withEmail: email, password: password) { (authDataResult, error) in
        completion(error)
        
        guard let id = authDataResult?.user.uid else {
          print("DEBUG : ERROR getting the id of the new user registration")
          return
        }
        
        if error != nil {
          print("DEBUG: Error: \(String(describing:error?.localizedDescription))")
          completion(error)
        } else {
          getFSCollectionReference(.users).document(authDataResult!.user.uid).setData( ["email":email,"firstname":firstname,"lastname":lastname,"Height":Height,"weight":weight,"DateOfBirth":DateOfBirth, "uid": id ,"type":"users"]) { (error) in
            if error != nil {
              completion(error)
            }
            
          }
        }
        
      }
  }
  
}

