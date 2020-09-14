//
//  TaxiMapBuilder.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 09/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI
import MapKit

enum TaxiMapBuilder {
    static func makeTaxiMapView(taxiListFetchable: TaxiListFetchableProtocol) -> some View {
        let northEstHamburgCoordinate = CLLocationCoordinate2D(latitude: 53.694865, longitude: 10.099891)
        let southWestHamburgCoordinate = CLLocationCoordinate2D(latitude: 53.394655, longitude:  9.757589)
        
        let viewModel = TaxiMapViewModel(taxiListFetchable: taxiListFetchable)
        return TaxiMapView(viewModel: viewModel, neCoord: northEstHamburgCoordinate, swCoord: southWestHamburgCoordinate, isUpdatedCoord: false)
    }
}
