//
//  TabBarViews.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI

private enum TabBarItems {
    case taxiList
    case taxiMap
}

// MARK: GamesTabView
struct TaxiListTabView: View {

    var body: some View {
        TaxiListBuilder.makeTaxiListView().tabItem {
            Image(systemName: SFSymbolName.tabBarTaxiList)
        }.tag(TabBarItems.taxiList)
    }
}
