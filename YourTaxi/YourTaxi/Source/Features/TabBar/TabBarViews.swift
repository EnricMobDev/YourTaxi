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

// MARK: - TaxiListTabView
struct TaxiListTabView: View {
    let taxiListFetchable: TaxiListFetchableProtocol

    var body: some View {
        TaxiListBuilder.makeTaxiListView(taxiListFetchable: taxiListFetchable).tabItem {
            Image(systemName: SFSymbolName.tabBarTaxiList)
            Text(StringKey.tabBarTaxiListItemName.localized)
        }.tag(TabBarItems.taxiList)
    }
}

// MARK: - TaxiMapTabView
struct TaxiMapTabView: View {
    let taxiListFetchable: TaxiListFetchableProtocol

    var body: some View {
        TaxiMapBuilder.makeTaxiMapView(taxiListFetchable: taxiListFetchable).tabItem {
            Image(systemName: SFSymbolName.tabBarTaxiMap)
            Text(StringKey.tabBarMapsItemName.localized)
        }.tag(TabBarItems.taxiMap)
    }
}
