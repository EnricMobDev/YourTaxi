//
//  TaxiMapBuilder.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 09/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI

enum TaxiMapBuilder {
    static func makeTaxiMapView(taxiListFetchable: TaxiListFetchableProtocol) -> some View {
        let viewModel = TaxiMapViewModel(taxiListFetchable: taxiListFetchable)
        return TaxiMapView(viewModel: viewModel)
    }
}
