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
        let app = XCUIApplication()
        app.launch()

        let mapsButton = app.tabBars.buttons["Maps"]
        mapsButton.tap()
    }
}
