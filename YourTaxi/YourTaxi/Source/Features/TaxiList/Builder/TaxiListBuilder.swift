//
//  TaxiListBuilder.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI

enum TaxiListBuilder {
    static func makeTaxiListView(taxiListFetchable: TaxiListFetchableProtocol) -> some View {
        let viewModel = TaxiListViewModel(taxiListFetchable: taxiListFetchable)
        return TaxiListView(viewModel: viewModel)
    }
}
