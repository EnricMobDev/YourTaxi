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
        .alert(isPresented: Binding<Bool>.constant(viewModel.showingAlert)) { () -> Alert in
            let alert = Alert(title: Text(StringKey.taxiListAlertTitle.localized),
                              message: Text(StringKey.taxiListAlertSubtitle.localized),
                              primaryButton: .default(Text(StringKey.taxiListAlertPrimaryButtonTitle.localized), action: {
                                self.viewModel.fetchTaxiList()
                              }), secondaryButton: .cancel())
            return alert
        }
        .onAppear(perform: viewModel.fetchTaxiList)
    }
}
