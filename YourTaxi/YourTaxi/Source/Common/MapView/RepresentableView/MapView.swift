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
    @Binding var neCoord: CLLocationCoordinate2D
    @Binding var swCoord: CLLocationCoordinate2D
    @Binding var isCoordUpdated: Bool

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
        let _ = pins.filter {
            let rangeOfLatitude = ($0.coordinate.latitude >= swCoord.latitude) && ($0.coordinate.latitude <= neCoord.latitude)
            let rangeOfLongitude = ($0.coordinate.longitude >= swCoord.longitude) && ($0.coordinate.longitude <= neCoord.longitude)
            
            if  rangeOfLatitude && rangeOfLongitude{
                let location = CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
                let annotation = MapPin(coordinate: location)
                let region = MKCoordinateRegion(center: location, span: span)
                
                view.setRegion(region, animated: true)
                view.addAnnotation(annotation)
            }
            return true
        }
    }
    
    // MARK: - MapCoordinator
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator(self, neCoord: $neCoord, swCoord: $swCoord, isCoordUpdated: $isCoordUpdated)
    }
}
