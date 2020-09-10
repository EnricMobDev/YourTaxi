//
//  TaxiMapViewModel.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 09/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import Combine
import Foundation
import MapKit
import SwiftUI

class TaxiMapViewModel: ObservableObject {
    // MARK: Variables
    @Published var dataSource: [TaxiListResponse.Taxi] = []
    private let taxiListFetchable: TaxiListFetchableProtocol
    private var disposables = Set<AnyCancellable>()
//    @Binding var neCoord: CLLocationCoordinate2D
//    @Binding var swCoord: CLLocationCoordinate2D
    
    //MARK: - Inicialization
    init(taxiListFetchable: TaxiListFetchableProtocol) {
        self.taxiListFetchable = taxiListFetchable
    }
    
    // MARK: Interactions
    func fetchTaxiList(firstLatitude: CLLocationDegrees, secondLatitude: CLLocationDegrees, firstLongitude: CLLocationDegrees, secondLongitude: CLLocationDegrees) {
        taxiListFetchable.fetchAllTaxis(firstLatitude: firstLatitude, // neCoord.lat
                                        secondLatitude: secondLatitude, // swCoord.lat
                                        firstLongitude: firstLongitude, // swCoord.long
                                        secondLongitude: secondLongitude) // neCoord.long
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.dataSource = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] taxiList in
                    guard let self = self else { return }
                    self.dataSource = taxiList.poiList
            })
            .store(in: &disposables)
    }
}
