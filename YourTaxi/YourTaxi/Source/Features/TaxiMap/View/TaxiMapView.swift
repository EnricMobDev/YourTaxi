//
//  TaxiMapView.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 09/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI
import Combine
import MapKit

struct TaxiMapView: View {
    //MARK: - Variables
    @ObservedObject var viewModel: TaxiMapViewModel
    
    // MARK: - Body
    var body: some View {
        MapView(pins: viewModel.dataSource)
    }
}
