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
    private let taxi: TaxiListResponse.Taxi
    
    var id: Int {
        return taxi.id
    }
    
    var type: String {
        return taxi.type
    }
    
    var state: String {
        return taxi.state
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
