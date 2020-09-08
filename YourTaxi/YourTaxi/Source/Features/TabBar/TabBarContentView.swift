//
//  ContentView.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI

struct TabBarContentView: View {
    let taxiListFetchable: TaxiListFetchableProtocol

    var body: some View {
        TabView {
            TaxiListTabView(taxiListFetchable: taxiListFetchable)
        }
    }
}
