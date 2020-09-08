//
//  RemoteManagerMock.swift
//  YourTaxiTests
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import Foundation
import Combine
@testable import YourTaxi

class RemoteManagerMock {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

//MARK: GameListFetchableProtocol
extension RemoteManagerMock: TaxiListFetchableProtocol {
    func fetchAllTaxis(firstLatitude: Double, secondLatitude: Double, firstLongitude: Double, secondLongitude: Double) -> AnyPublisher<TaxiListResponse, TaxiListErrors> {
        self.request()
    }
    
    private func request<T>() -> AnyPublisher<T, TaxiListErrors> where T: Decodable {
        let json = loadJsonFrom(fileName: "TaxiListResponseMock")
        return decode(json)
    }
    
    private func loadJsonFrom(fileName: String) -> Data {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!))
        return jsonData
    }
}
