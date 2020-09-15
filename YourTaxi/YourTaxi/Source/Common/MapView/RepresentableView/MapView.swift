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
    @State var neCoord = CLLocationCoordinate2D(latitude: 53.694865, longitude: 10.099891)
    @State var swCoord = CLLocationCoordinate2D(latitude: 53.394655, longitude:  9.757589)

    // MARK: MapView Creation
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01,
                                    longitudeDelta: 0.01)
        
        let center: CLLocationCoordinate2D
        if pins.count == 1, let point = pins.first?.coordinate {
            center = CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
        } else {
            center = CLLocationCoordinate2D(latitude: (neCoord.latitude + swCoord.latitude) / 2,
                                            longitude: (neCoord.longitude + swCoord.longitude) / 2)
        }
        
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.removeAnnotations(view.annotations)
        
        let annotations: [MKAnnotation] = pins
            .map {
            let location = CLLocationCoordinate2D(latitude: $0.coordinate.latitude,
                                                  longitude: $0.coordinate.longitude)
            return MapPin(coordinate: location)
        }
    
        view.addAnnotations(annotations)
    }
    
    // MARK: - MapCoordinator
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator(self, neCoord: $neCoord, swCoord: $swCoord)
    }
}
