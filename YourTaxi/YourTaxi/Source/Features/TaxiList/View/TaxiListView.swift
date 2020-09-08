//
//  TaxiListView.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI

struct TaxiListView: View {
    @ObservedObject var viewModel: TaxiListViewModel

    var body: some View {
        List {
            ForEach(viewModel.dataSource, content: TaxiListRowView.init(viewModel:))
        }
        .onAppear(perform: viewModel.fetchTaxiList)
    }
}
