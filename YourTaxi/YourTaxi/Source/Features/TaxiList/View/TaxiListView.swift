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
    @State private var showAlert = false
    
    var body: some View {
        List {
            ForEach(viewModel.dataSource, content: TaxiListRowView.init(viewModel:))
        }
        .alert(isPresented: $showAlert) { () -> Alert in
            let alert = Alert(title: Text("Are you Sure?"), message: Text("Message"), primaryButton: .default(Text("Confirm"), action: {
                    print("OK")
                }), secondaryButton: .cancel({
                    print("Cancel")
                }))
            return alert;
        }
        .onAppear(perform: viewModel.fetchTaxiList)
    }
}
