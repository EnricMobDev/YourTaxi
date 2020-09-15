//
//  ContentView.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI

struct TabBarContentView: View {
    //MARK: - Variables
    let taxiListFetchable: TaxiListFetchableProtocol

    //MARK: - Body
    var body: some View {
        TabView {
            TaxiListTabView(taxiListFetchable: taxiListFetchable)
            TaxiMapTabView(taxiListFetchable: taxiListFetchable)
        }
    }
}
