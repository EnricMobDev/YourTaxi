//
//  YourTaxiUITests.swift
//  YourTaxiUITests
//
//  Created by Laura Lopez Hernandez on 14/09/2020.
//  Copyright © 2020 EnricPou. All rights reserved.
//

import XCTest

class TaxiListViewUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        super.setUp()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testTaxiList() throws {
        assert(app.tabBars.buttons["List"].waitForExistence(timeout: 5))
        let texts = app.staticTexts
        app.swipeUp()
        let newTexts = app.staticTexts
        XCTAssertNotEqual(texts, newTexts)
    }
}
