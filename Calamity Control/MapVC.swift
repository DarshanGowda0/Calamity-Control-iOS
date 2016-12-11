//
//  MapVC.swift
//  Calamity Control
//
//  Created by Darshan Gowda on 11/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit
import GoogleMaps
import FirebaseDatabase

class MapVC: UIViewController,GMSMapViewDelegate {

    var ref : FIRDatabaseReference!
    var reports = [Report]()
    
    var myMap : GMSMapView!
    
//    15.3173° N, 75.7139° E

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        fetchData()
    }
    
    func fetchData(){
        ref.child("reports").observeSingleEvent(of: .value, with: {(snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshot{
                    print("SNAP \(snap)")
                    if let dict = snap.value as? Dictionary<String,AnyObject>{
                        let report = Report(dict: dict)
                        self.reports.append(report)
                    }
                }
            }
            print("CALLING load again")
            self.loadView()
//            self.addMarkers()
        }){(error) in
            print(error.localizedDescription)
        }
    }
    
    func addMarkers(){
        
        
        myMap.delegate = self
        
        print("in add markers")
        
        for report in reports{
            
            print("in loop for \(report.lat)")
            let lat = report.lat
            let lon = report.lon
            let calamity = report.calamity
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: lat , longitude: lon)
//            marker.appearAnimation = kGMSMarkerAnimationPop
            marker.title = calamity
            marker.map = myMap
            
            view = myMap
        }
        
        
    }
    
    override func loadView() {
        
//        let camera = GMSCameraPosition.camera(withLatitude: 15.3173,
//                                              longitude:75.7139,
//                                              zoom:6)

        let camera = GMSCameraPosition.camera(withLatitude: 15.3173, longitude: 75.7139, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        
        for report in reports{
            print("INSIDE")
            let mark = GMSMarker()
            mark.position = CLLocationCoordinate2D(latitude: Double(report.lat), longitude: Double(report.lon))
            mark.title = "\(report.calamity)"
            mark.snippet = "India"
            mark.map = mapView
        }
    
    }
    
    
}
