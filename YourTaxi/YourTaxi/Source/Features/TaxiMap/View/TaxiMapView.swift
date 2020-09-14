//
//  TaxiMapView.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 09/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI
import MapKit

struct TaxiMapView: View {
    //MARK: - Variables
    @ObservedObject var viewModel: TaxiMapViewModel
    @State var neCoord: CLLocationCoordinate2D
    @State var swCoord: CLLocationCoordinate2D
    @State var isUpdatedCoord: Bool

    // MARK: - Body
    var body: some View {
        if isUpdatedCoord {
           self.viewModel.fetchTaxiList(firstLatitude: neCoord.latitude, secondLatitude: swCoord.latitude, firstLongitude: swCoord.longitude, secondLongitude: neCoord.longitude)
        }
        
        return AnyView(MapView(pins: viewModel.dataSource, neCoord: $neCoord, swCoord: $swCoord, isUpdatedCoord: $isUpdatedCoord))
            .onAppear {
                self.viewModel.fetchTaxiList(firstLatitude: self.neCoord.latitude, secondLatitude: self.swCoord.latitude, firstLongitude: self.swCoord.longitude, secondLongitude: self.neCoord.longitude)
        }
    }
}
