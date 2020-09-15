//
//  TaxiListViewModelTests.swift
//  YourTaxiTests
//
//  Created by Laura Lopez Hernandez on 08/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import XCTest
import Combine
@testable import YourTaxi

class TaxiListViewModelTests: XCTestCase {

    var remoteManagerMock: RemoteManagerMock!
    var taxiListMock: TaxiListMock!
    var viewModel: TaxiListViewModel!
    private var disposables = Set<AnyCancellable>()
    
    override func setUp() {
        remoteManagerMock = RemoteManagerMock()
        taxiListMock = TaxiListMock()
        viewModel = TaxiListViewModel(taxiListFetchable: remoteManagerMock)
    }
    
    override func tearDown() {
        remoteManagerMock = nil
        taxiListMock = nil
        viewModel = nil
    }
    
    func testFetchGameList() {
        let expectation = XCTestExpectation(description: "Loading games")
        self.viewModel.fetchTaxiList()

        viewModel.$dataSource
            .dropFirst()
            .sink {
                XCTAssertEqual($0, [self.taxiListMock.taxis])
                expectation.fulfill()
            }
            .store(in: &disposables)
        
        wait(for: [expectation], timeout: 10.0)
    }

}
