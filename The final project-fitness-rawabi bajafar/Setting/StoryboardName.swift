//
//  StoryboardName.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 06/06/1443 AH.
//

import Foundation
import UIKit


 
enum StoryboardName: String {
    case main = "Main"
}

protocol Storyboarded {
    static var storyboardIdentifier: String { get }
    static var storyboardName: StoryboardName { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }

    static var storyboardName: StoryboardName {
        return .main
    }

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}