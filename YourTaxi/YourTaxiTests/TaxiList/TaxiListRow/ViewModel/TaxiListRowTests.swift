//
//  TaxiListRowTests.swift
//  YourTaxiTests
//
//  Created by Laura Lopez Hernandez on 14/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import XCTest
@testable import YourTaxi

class TaxiListRowTests: XCTestCase {

    var taxiListRowViewModel: TaxiListRowViewModel!
    
    override func setUpWithError() throws {
        let taxi = TaxiListMock.taxiList
        taxiListRowViewModel = TaxiListRowViewModel(taxi: taxi)
    }

    override func tearDownWithError() throws {
        taxiListRowViewModel = nil
    }

    func testTypeUpdated() {
        // Given
        let mockType = "TAXI"
        // When
        let realType = taxiListRowViewModel.taxi.type
        // Then
        XCTAssertEqual(mockType, realType)
    }
    
    func testStateUpdated() {
        // Given
        let mockState = "ACTIVE"
        // When
        let realState = taxiListRowViewModel.taxi.state
        // Then
        XCTAssertEqual(mockState, realState)
    }
    
    func testLicenseUpdated() {
        // Given
        let mockLicense = 1647471866
        // When
        let realLicense = taxiListRowViewModel.taxi.license
        // Then
        XCTAssertEqual(mockLicense, realLicense)
    }
}
