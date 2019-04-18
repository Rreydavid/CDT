//
//  iScoutUITests.swift
//  iScoutUITests
//
//  Created by David Mercado on 2/1/19.
//  Copyright © 2019 CDT. All rights reserved.
//
// Reference: https://www.raywenderlich.com/709-ios-unit-testing-and-ui-testing-tutorial
// TODO: make unit tests for moving the map
// TODO: make unit test for checking to see if the tables move up and down

import XCTest
import UIKit
import MapKit

class iScoutUITests: XCTestCase {

    // declare the ViewController that's being tested
    //var testingViewController : UIViewController!
    
    // initialize app
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTabBar() {
        
        let tabBarsQuery = app.tabBars
        let tabCPSelect = tabBarsQuery.buttons["CP"]
        let tabMapSelect = tabBarsQuery.buttons["Map"]
        let tabSyncSelect = tabBarsQuery.buttons["Sync"]
        
        tabCPSelect.tap()
        XCTAssertTrue(tabCPSelect.isSelected)
        tabMapSelect.tap()
        XCTAssertTrue(tabMapSelect.isSelected)
        tabSyncSelect.tap()
        XCTAssertTrue(tabSyncSelect.isSelected)
    }
    
    func testMaptype() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Map"].tap()
        
        let navigationBarsQuery = app.navigationBars
        let satSelect = navigationBarsQuery/*@START_MENU_TOKEN@*/.buttons["Satellite"]/*[[".segmentedControls.buttons[\"Satellite\"]",".buttons[\"Satellite\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let hybridSelect = navigationBarsQuery/*@START_MENU_TOKEN@*/.buttons["Hybrid"]/*[[".segmentedControls.buttons[\"Hybrid\"]",".buttons[\"Hybrid\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let mapSelect = navigationBarsQuery/*@START_MENU_TOKEN@*/.buttons["Map"]/*[[".segmentedControls.buttons[\"Map\"]",".buttons[\"Map\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        satSelect.tap()
        XCTAssertTrue(satSelect.isSelected)
        hybridSelect.tap()
        XCTAssertTrue(hybridSelect.isSelected)
        mapSelect.tap()
        XCTAssertTrue(mapSelect.isSelected)
    }
    
}
