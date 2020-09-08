//
//  MapView.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import MapKit
import SwiftUI
import Combine

struct MapView: UIViewRepresentable {
    // MARK: Variables
    var pins: [TaxiListResponse.Taxi]

    // MARK: MapView Creation
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.removeAnnotations(view.annotations)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let _ = pins.map { taxi in
            let location = CLLocationCoordinate2D(latitude: taxi.coordinate.latitude, longitude: taxi.coordinate.longitude)
                let annotation = MapPin(coordinate: location)
                let region = MKCoordinateRegion(center: location, span: span)
                view.setRegion(region, animated: true)
                view.addAnnotation(annotation)
        }
    }
    
    // MARK: - MapCoordinator
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator(self)
    }
}
