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
    @State var isCoordUpdated: Bool

    // MARK: - Body
    var body: some View {
        MapView(pins: viewModel.dataSource, neCoord: $neCoord, swCoord: $swCoord, isCoordUpdated: $isCoordUpdated)
            .onAppear {
                self.viewModel.fetchTaxiList(firstLatitude: self.neCoord.latitude, secondLatitude: self.swCoord.latitude, firstLongitude: self.swCoord.longitude, secondLongitude: self.neCoord.longitude)
        }
        //        viewModel.fetchTaxiList(firstLatitude: neCoord.latitude, secondLatitude: swCoord.latitude, firstLongitude: swCoord.longitude, secondLongitude: neCoord.longitude)
        //        return AnyView(MapView(pins: viewModel.dataSource, neCoord: $neCoord, swCoord: $swCoord, isCoordUpdated: $isCoordUpdated))
        
        //        guard let neLatitude = neCoord?.latitude,
        //            let swLatitude = swCoord?.latitude,
        //            let swLongitude = swCoord?.longitude,
        //            let neLongitude = neCoord?.longitude,
        //            let isCoordUpdated = isCoordUpdated else { return AnyView(EmptyView()) }
        
        //        if isCoordUpdated {
        //            
        //            viewModel.fetchTaxiList(firstLatitude: neLatitude,
        //                                    secondLatitude: swLatitude,
        //                                    firstLongitude: swLongitude,
        //                                    secondLongitude: neLongitude)
        //        }
        //        
        //        return AnyView(MapView(pins: viewModel.dataSource, neCoord: $neCoord, swCoord: $swCoord, isCoordUpdated: $isCoordUpdated))
        //            .onAppear(perform: viewModel.fetchTaxiList(firstLatitude: $neLatitude,
        //                                                       secondLatitude: swLatitude,
        //                                                       firstLongitude: swLongitude,
        //                                                       secondLongitude: neLongitude))
    }
}
