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
        HStack {
            Text(viewModel.type)
            Text(viewModel.state)
            Text("\(viewModel.id)")
        }
    }
}
