//
//  ExploreViewController.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import UIKit
import MapKit

class ExploreViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, SingleButtonDialogPresenter {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let viewModel:ExploreViewControllerViewModel
    let locationManager = CLLocationManager()

    required init?(coder aDecoder: NSCoder) {
        self.viewModel = ExploreViewControllerViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        bindViewModel()
        viewModel.getVenues()
    }
    
    func setupViews() {
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }

    }
    
    func bindViewModel() {
        viewModel.venues.bind { [unowned self](venues) in
            for venue in venues {
                self.createAnnotation(venue: venue)
            }
        }
        
        viewModel.onShowError = { [unowned self] alert in
            self.presentSingleButtonDialog(alert: alert)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        
    }
    
    
    func createAnnotation(venue: Venue ) {
        guard let latitude = venue.lat else { return }
        guard let longitude = venue.long else { return }
        guard let title = venue.cashback , let subtitle = venue.name else { return }
    
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        myAnnotation.title = "\(title)"
        myAnnotation.subtitle = "\(subtitle)"

        mapView.addAnnotation(myAnnotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
