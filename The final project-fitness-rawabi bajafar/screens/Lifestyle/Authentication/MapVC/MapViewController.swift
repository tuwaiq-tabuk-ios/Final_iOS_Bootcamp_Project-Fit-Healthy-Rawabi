//
//  MapViewController.swift
//  The final project-fitness-rawabi bajafar
//
//  Created by روابي باجعفر on 02/06/1443 AH.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController , CLLocationManagerDelegate {
  
  @IBOutlet var mapView: MKMapView!
  @IBOutlet var statusLabel: UILabel!
  
  let manager = CLLocationManager()
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
                       [CLLocation]) {
    
    let location = locations[0]
    let span = MKCoordinateSpan(latitudeDelta: 0.03 , longitudeDelta: 0.03)
    
    let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
    let region = MKCoordinateRegion(center: myLocation, span: span)
    mapView.setRegion(region, animated: true)
    
    self.mapView.showsUserLocation = true
    statusLabel.text = "\(location.speed)"
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
  }
  
  
}
