//
//  TaxiListRowViewModel.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI

struct TaxiListRowViewModel: Identifiable {
    //MARK: - Variables
    private let car: TaxiListResponse.Taxi
    
    var id: Int {
        return car.id
    }
    
    var type: String {
        return car.type
    }
    
    var state: String {
        return car.state
    }
}

