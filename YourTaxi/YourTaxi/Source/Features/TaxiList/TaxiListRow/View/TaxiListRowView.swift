//
//  TaxiListRowView.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI
import MapKit

struct TaxiListRowView: View {
    //MARK: - Variables
    private let viewModel: TaxiListRowViewModel
    
    //MARK: - Initialization
    init(viewModel: TaxiListRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.type)
                .font(.title)
            mapView()
            Text("\(StringKey.taxiListState.localized): \(viewModel.state)")
            Text("\(StringKey.taxiListLicene.localized): \(viewModel.license)")
        }
    }
    
    // MARK: - Views Design
    private func mapView() -> some View {
        let emptyLocation = Binding<CLLocationCoordinate2D>.constant(CLLocationCoordinate2D())
        
        return MapView(pins: [viewModel.taxi], neCoord: emptyLocation, swCoord: emptyLocation, isUpdatedCoord: Binding<Bool>.constant(false))
            .cornerRadius(25)
            .disabled(true)
            .padding(.horizontal)
            .frame(height: 180)
    }
}
