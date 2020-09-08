//
//  TaxiListMock.swift
//  YourTaxiTests
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import XCTest
@testable import YourTaxi

struct TaxiListMock {
    static let locations = TaxiListResponse.Coordinate(latitude: 53.56240493421279,
                                                       longitude: 9.975336827337742)

    static let taxiList = TaxiListResponse.Taxi(id: 1647471866,
                                              coordinate: locations,
                                              state: "ACTIVE",
                                              type: "TAXI",
                                              heading: 0.0)
    let taxis = TaxiListRowViewModel(taxi: taxiList)
}
