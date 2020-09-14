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

    func testIdIsNotNil() throws {
        XCTAssertNotNil(taxiListRowViewModel.id)
    }

    func testTypeUpdated() {
        // Given
        let mockType = "TAXI"
        // When
        let realType = taxiListRowViewModel.type
        // Then
        XCTAssertEqual(mockType, realType)
    }
    
    func testStateUpdated() {
        // Given
        let mockState = "ACTIVE"
        // When
        let realState = taxiListRowViewModel.state
        // Then
        XCTAssertEqual(mockState, realState)
    }
    
    func testLicenseUpdated() {
        // Given
        let mockLicense = 1647471866
        // When
        let realLicense = taxiListRowViewModel.license
        // Then
        XCTAssertEqual(mockLicense, realLicense)
    }
    
    func testIfIsEquatableObject() {
        // Given
        let firstTaxi = TaxiListMock.taxiList
        var firstMockTaxiObject = TaxiListRowViewModel(taxi: firstTaxi)
        firstMockTaxiObject.id = UUID(uuidString: UIDevice.current.identifierForVendor!.uuidString)!
        
        let secondTaxi = TaxiListMock.taxiList
        var secondMockTaxiObject = TaxiListRowViewModel(taxi: secondTaxi)
        secondMockTaxiObject.id = UUID(uuidString: UIDevice.current.identifierForVendor!.uuidString)!
         // Then
        XCTAssertEqual(firstMockTaxiObject, secondMockTaxiObject)
    }

}
