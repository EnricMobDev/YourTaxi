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
    @Binding var neCoord: CLLocationCoordinate2D
    @Binding var swCoord: CLLocationCoordinate2D
    @Binding var isUpdatedCoord: Bool
    
    // MARK: Inicialization
    init(_ parent: MapView, neCoord: Binding<CLLocationCoordinate2D>, swCoord: Binding<CLLocationCoordinate2D>, isUpdatedCoord : Binding<Bool>) {
        self.parent = parent
        _neCoord = neCoord
        _swCoord = swCoord
        _isUpdatedCoord = isUpdatedCoord
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
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let mRect = mapView.visibleMapRect
        let neMapPoint = MKMapPoint(x: mRect.maxX, y: mRect.origin.y)
        let swMapPoint = MKMapPoint(x: mRect.origin.x, y: mRect.maxY)
        
        neCoord = neMapPoint.coordinate
        swCoord = swMapPoint.coordinate
        isUpdatedCoord = true
    }
}
