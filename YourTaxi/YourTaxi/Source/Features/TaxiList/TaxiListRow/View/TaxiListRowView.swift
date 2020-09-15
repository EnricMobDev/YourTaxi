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
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.taxi.type)
                .font(.title)
            mapView()
            Text("\(StringKey.taxiListState.localized): \(viewModel.taxi.state)")
            Text("\(StringKey.taxiListLicene.localized): \(viewModel.taxi.license)")
        }
    }
    
    // MARK: - Views Design
    private func mapView() -> some View {
        return MapView(pins: [viewModel.taxi])
            .cornerRadius(25)
            .disabled(true)
            .padding(.horizontal)
            .frame(height: 180)
    }
}
