//
//  TaxiListResponse.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import Foundation

struct TaxiListResponse: Codable {
    let poiList: [Taxi]

    // MARK: - Taxi
    struct Taxi: Codable {
        let id: Int
        let coordinate: Coordinate
        let state, type: String
        let heading: Double
    }

    // MARK: - Coordinate
    struct Coordinate: Codable {
        let latitude, longitude: Double
    }
}
