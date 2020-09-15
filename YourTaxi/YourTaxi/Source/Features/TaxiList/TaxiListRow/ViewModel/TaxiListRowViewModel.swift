//
//  TaxiListRowViewModel.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import SwiftUI
import MapKit

struct TaxiListRowViewModel: Equatable { 
    //MARK: - Variables
    let taxi: TaxiListResponse.Taxi
    
    //MARK: - Initialization
    init(taxi: TaxiListResponse.Taxi) {
        self.taxi = taxi
    }
}
