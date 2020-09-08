//
//  RemoteManager.swift
//  YourTaxi
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import Foundation
import Combine

protocol TaxiListFetchableProtocol {
    func fetchAllTaxis(firstLatitude: Double, secondLatitude: Double, firstLongitude: Double, secondLongitude: Double) -> AnyPublisher<TaxiListResponse, TaxiListErrors>
}

public class RemoteManager {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

//MARK: TaxiListFetchableProtocol
extension RemoteManager: TaxiListFetchableProtocol {
    func fetchAllTaxis(firstLatitude: Double, secondLatitude: Double, firstLongitude: Double, secondLongitude: Double) -> AnyPublisher<TaxiListResponse, TaxiListErrors> {
        self.request(with: makeTaxiListComponents(firstLatitude: firstLatitude, secondLatitude: secondLatitude, firstLongitude: firstLongitude, secondLongitude: secondLongitude))
    }
    
    private func request<T>(with components: URLComponents) -> AnyPublisher<T, TaxiListErrors> where T: Decodable {
      guard let url = components.url else {
        let error = TaxiListErrors.network(description: "Couldn't create URL")
        return Fail(error: error).eraseToAnyPublisher()
      }
      return session.dataTaskPublisher(for: URLRequest(url: url))
        .mapError { error in
          .network(description: error.localizedDescription)
        }
        .flatMap(maxPublishers: .max(1)) { pair in
            decode(pair.data)
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - RemoteManager API
private extension RemoteManager {
    struct TaxiListAPI {
        static let scheme = "https"
        static let host = "poi-api.mytaxi.com"
        static let path = "/PoiService/poi/v1"
    }
    
    func makeTaxiListComponents(firstLatitude: Double, secondLatitude: Double, firstLongitude: Double, secondLongitude: Double) -> URLComponents {
        var components = URLComponents()
        components.scheme = TaxiListAPI.scheme
        components.host = TaxiListAPI.host
        components.path = TaxiListAPI.path
        
        components.queryItems = [
          URLQueryItem(name: "p2Lat", value: "\(secondLatitude)"),
          URLQueryItem(name: "p1Lon", value: "\(firstLongitude)"),
          URLQueryItem(name: "p1Lat", value: "\(firstLatitude)"),
          URLQueryItem(name: "p2Lon", value: "\(secondLongitude)")
        ]
        
        return components
    }
}

enum TaxiListErrors:Error {
    case parsing(description: String)
    case network(description: String)
}

