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
    struct Taxi: Codable, Equatable {
        let license: Int
        let coordinate: Coordinate
        let state, type: String
        let heading: Double
        
        enum CodingKeys: String, CodingKey {
            case license = "id"
            case coordinate, state, type, heading
        }
    }

    // MARK: - Coordinate
    struct Coordinate: Codable, Equatable {
        let latitude, longitude: Double
    }
}
