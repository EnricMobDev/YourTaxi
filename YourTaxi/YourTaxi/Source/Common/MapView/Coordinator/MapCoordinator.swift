//
//  MapCoordinator.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import MapKit
import Combine
import SwiftUI

class MapCoordinator: NSObject, MKMapViewDelegate {
    // MARK: Variables
    var parent: MapView

    // MARK: Inicialization
    init(_ parent: MapView) {
        self.parent = parent
    }
    
    // MARK: Annotation methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Placemark"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
}
