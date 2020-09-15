//
//  TaxiMapUITest.swift
//  YourTaxiUITests
//
//  Created by Laura Lopez Hernandez on 14/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import XCTest

class TaxiMapUITest: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        super.setUp()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testLoadMapView() throws {
        app.tabBars.buttons["Maps"].tap()
        let annotations = app.maps.firstMatch.otherElements
        app.maps.firstMatch.swipeLeft()
        app.maps.firstMatch.swipeUp()
        let newAnnotations = app.maps.firstMatch.otherElements
        XCTAssertNotEqual(annotations, newAnnotations)
    }
}
