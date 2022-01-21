//
//  FSCollectionReference.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 16/06/1443 AH.
//


import Foundation
import Firebase
import FirebaseFirestore

enum FSCollectionReference: String {
  
  case users
  case details
  
}

func getFSCollectionReference(_ collectionReference: FSCollectionReference ) -> CollectionReference {
return Firestore.firestore()
    .collection(collectionReference.rawValue)
}
