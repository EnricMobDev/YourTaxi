//
//  TaxiListView.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI

struct TaxiListView: View {
    //MARK: - Variables
    @ObservedObject var viewModel: TaxiListViewModel
    
    // MARK: - Body
    var body: some View {
        if viewModel.isShowingLoader {
            viewModel.fetchTaxiList()
            return AnyView(emptyView)
        } else {
             return AnyView(dataLoadedView)
        }
    }
    
    // MARK: - Views Design
    var emptyView: some View {
        Text(StringKey.taxiListLoadingMessage.localized)
    }
    
    var dataLoadedView: some View {
        List {
            ForEach(viewModel.dataSource, id: \.taxi.license, content: TaxiListRowView.init(viewModel:))
        }
    }
}
