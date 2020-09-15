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
    
    // MARK: Inicialization
    init(_ parent: MapView, neCoord: Binding<CLLocationCoordinate2D>,
         swCoord: Binding<CLLocationCoordinate2D>) {
        self.parent = parent
        _neCoord = neCoord
        _swCoord = swCoord
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

        postNotificationWithCoordinate(neMapPoint: neMapPoint, swMapPoint: swMapPoint)
    }
}

//MARK: - Notifications
enum Coordinates: String {
    case nePoint = "nePoint"
    case swPoint = "swPoint"
}

extension MapCoordinator {
    private func postNotificationWithCoordinate(neMapPoint: MKMapPoint, swMapPoint: MKMapPoint) {
        NotificationCenter.default.post(name: Notification.Name.Map.updatedRegion, object: self,
                                        userInfo: [
                                            Coordinates.nePoint: neMapPoint,
                                            Coordinates.swPoint: swMapPoint
        ])
    }
}
