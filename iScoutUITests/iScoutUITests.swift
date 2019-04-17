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
        // run app for UI Tests
        app = XCUIApplication()
        app.launch()
        
        /*super.setUp()
        
        // get the storyboard and ViewController for testing
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        testingViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as UIViewController

        // load the view
        if(testingViewController != nil){
            testingViewController.loadView()
            testingViewController.viewDidLoad()
            _ = testingViewController.view
        }*/
 
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //testingViewController = nil
    }

    func testExample() {
        
    }

}
