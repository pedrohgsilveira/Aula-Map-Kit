//
//  ViewController.swift
//  AulaMapKit
//
//  Created by Pedro Henrique Guedes Silveira on 26/09/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapVIew: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPin()
        checkIfLocationIsAvaiable()
        // Do any additional setup after loading the view.
    }
    
    func checkIfLocationIsAvaiable(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    func createPin(){
        let annotation = MKPointAnnotation()
        guard let latitude = locationManager.location?.coordinate.latitude else {return}
        guard let longitude = locationManager.location?.coordinate.longitude else {return}
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = "Pin"
        annotation.subtitle = "Pinado"
        mapVIew.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: CLLocationDistance(exactly: 700)!, longitudinalMeters: CLLocationDistance(exactly: 700)!)
        mapVIew.setRegion(region, animated: true)
    }


}

