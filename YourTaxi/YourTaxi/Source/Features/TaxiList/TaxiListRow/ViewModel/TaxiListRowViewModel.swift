//
//  TaxiListRowViewModel.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI
import MapKit

struct TaxiListRowViewModel: Identifiable {
    //MARK: - Variables
    let taxi: TaxiListResponse.Taxi
    
    var id = UUID()
    
    var type: String {
        return taxi.type
    }
    
    var state: String {
        return taxi.state
    }
    
    var license: Int {
        return taxi.id
    }
    
    //MARK: - Initialization
    init(taxi: TaxiListResponse.Taxi) {
        self.taxi = taxi
    }
}

//MARK: - Equatable
extension TaxiListRowViewModel: Equatable {
    static func == (lhs: TaxiListRowViewModel, rhs: TaxiListRowViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
