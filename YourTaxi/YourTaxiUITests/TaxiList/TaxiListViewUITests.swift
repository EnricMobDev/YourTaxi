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

    func testlistOfTaxisAndTapInTabBarMapView() throws {
        let app = XCUIApplication()
        app.launch()

        let listButton = XCUIApplication().tabBars.buttons["List"]
        listButton.swipeUp()
        listButton.tap()
        XCUIDevice.shared.orientation = .portrait
        XCUIApplication().tabBars.buttons["Maps"].tap()
    }
}
