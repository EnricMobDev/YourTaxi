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
    
    //MARK: - Inicialization
    init(taxiListFetchable: TaxiListFetchableProtocol) {
        self.taxiListFetchable = taxiListFetchable
        addObserverAndFetchedTaxis()
    }
    
    deinit {
        self.removeObserverForFetchedTaxis()
    }

    // MARK: Interactions
    func fetchTaxis(in nePoint: CLLocationCoordinate2D, and swPoint: CLLocationCoordinate2D) {
        taxiListFetchable.fetchAllTaxis(firstLatitude: nePoint.latitude, 
                                        secondLatitude: swPoint.latitude,
                                        firstLongitude: swPoint.longitude,
                                        secondLongitude: nePoint.longitude)
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

// MARK: - Notifications
extension TaxiMapViewModel {
    private func addObserverAndFetchedTaxis() {
        NotificationCenter.default.addObserver(forName: Notification.Name.Map.updatedRegion, object: nil, queue: .main) {
            [weak self] in
            guard let self = self,
                let userInfo = $0.userInfo,
                let nePoint = userInfo[Coordinates.nePoint] as? MKMapPoint,
                let swPoint = userInfo[Coordinates.swPoint] as? MKMapPoint else { preconditionFailure("Notification can't add observer") }
            
            self.fetchTaxis(in: nePoint.coordinate, and: swPoint.coordinate)
        }
    }
    
    private func removeObserverForFetchedTaxis() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.Map.updatedRegion, object: nil)
    }
}
