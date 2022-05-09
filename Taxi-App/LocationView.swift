//
//  LocationView.swift
//  Taxi-App
//
//  Created by Rza Ismayilov on 06.05.22.
//

import UIKit
import SnapKit
import MapKit

class LocationView: UIView {
    
    private lazy var map : MKMapView = {
        let view = MKMapView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self

        self.addSubview(view)
        self.sendSubviewToBack(view)
        return view
    }()
    
    private lazy var currentLocation = AnnotationLocation(title: "Your Location", coordinate: CLLocationCoordinate2D(latitude: 40.410952, longitude: 49.934949))
    
    private lazy var locationManager =  CLLocationManager()
    
    private lazy var bottomView : UIView = DestinationView().setupView(parent: self) as UIView
//    private lazy var bottomView : UIView = TrackingView().setupView() as UIView

    
    public func setupView() -> LocationView {
        
        self.addSubview(bottomView)
        
        let taxiLoc1 = CLLocationCoordinate2D(latitude: 40.412205, longitude: 49.936474)
        let taxiLoc2 = CLLocationCoordinate2D(latitude: 40.409436, longitude: 49.933469)
        let taxiLoc3 = CLLocationCoordinate2D(latitude: 40.409615, longitude: 49.940497)
   
        map.addAnnotation(AnnotationLocation(title: "taxi", coordinate: taxiLoc1))
        map.addAnnotation(AnnotationLocation(title: "taxi", coordinate: taxiLoc2))
        map.addAnnotation(AnnotationLocation(title: "taxi", coordinate: taxiLoc3))

        locationManager.requestWhenInUseAuthorization()
                
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
//        map.setRegion(currentLocation.coordinate, animated: true)
        
        map.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top).offset(48)
        }
        
        bottomView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        return self
    }
    
    public func loadBottomView(newView : UIView) {
        self.bottomView.removeFromSuperview()
        self.addSubview(newView)

        newView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        map.snp.makeConstraints { make in
            make.bottom.equalTo(newView.snp.top).offset(48)
        }
        
        self.bottomView = newView
    }
}

extension LocationView : CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let recentLocation = locations.last {
            map.removeAnnotation(currentLocation)

            currentLocation.coordinate = recentLocation.coordinate
            
            let region = MKCoordinateRegion(
                center: currentLocation.coordinate,
                latitudinalMeters: 1000,
                longitudinalMeters: 1000)
            
            map.setRegion(region, animated: true)
            map.addAnnotation(currentLocation)

        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation is MKUserLocation) {
                return nil
        }
        let reuseid = "taxi"
        var taxiView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseid)
        if taxiView == nil {
            taxiView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseid)
            if (annotation.title == "taxi") {
                taxiView?.image = UIImage(named:"taxiIcon")
            } else {
                taxiView?.image = UIImage(named:"locationIcon")
            }
            taxiView?.canShowCallout = true
        } else {
            taxiView?.annotation = annotation
        }
        return taxiView
    }
}

class AnnotationLocation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(title: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
    
}
