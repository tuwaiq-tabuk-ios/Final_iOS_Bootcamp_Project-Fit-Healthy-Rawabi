//
//  searchResultsController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 03/05/1443 AH.
//

import UIKit
import WebKit


class SearchResultsController : UIViewController, WKUIDelegate  {
    
  let webView = WKWebView()
    

  @IBOutlet weak var myView: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
     myView.addSubview(webView)
      guard let myURL = URL(string:"https://www.delicious.com.au/recipes/collections/gallery/60-healthy-dinners-you-can-cook-in-30-minutes/1vo4q819?page=4") else {
        return
      }
      webView.load(URLRequest(url: myURL))
    }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    webView.frame = view.bounds
  }
  
}
  
