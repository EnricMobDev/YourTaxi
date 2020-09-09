//
//  TaxiMapViewModel.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 09/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import Combine
import Foundation

class TaxiMapViewModel: ObservableObject {
    // MARK: Variables
    @Published var dataSource: [TaxiListResponse.Taxi] = []
    private let taxiListFetchable: TaxiListFetchableProtocol
    private var disposables = Set<AnyCancellable>()

    //MARK: - Inicialization
    init(taxiListFetchable: TaxiListFetchableProtocol) {
        self.taxiListFetchable = taxiListFetchable
    }
    
    //MARK: - HamburgCoordinate
    private struct HamburgCoordinate {
        static let firstLatitude = 53.694865
        static let secondLatitude = 53.394655
        static let firstLongitude = 9.757589
        static let secondLongitude = 10.099891
    }
    
    // MARK: Interactions
    func fetchTaxiList() {
        taxiListFetchable.fetchAllTaxis(firstLatitude: HamburgCoordinate.firstLatitude,
                                        secondLatitude: HamburgCoordinate.secondLatitude,
                                        firstLongitude: HamburgCoordinate.firstLongitude,
                                        secondLongitude: HamburgCoordinate.secondLongitude)
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
