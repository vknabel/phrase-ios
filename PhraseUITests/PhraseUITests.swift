//
//  PhraseUITests.swift
//  PhraseUITests
//
//  Created by Valentin Knabel on 12.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import XCTest

class PhraseUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSnapshotPhraseDetails() {
        // Use recording to get started writing UI tests.
        
        app = XCUIApplication()
        app.otherElements.containing(.button, identifier:"Create").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.swipeUp()
        app.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
        snapshot("PhraseDetails")
    }
    
    func testSnapshotPhraseCollection() {
        app = XCUIApplication()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
        _ = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).staticTexts["One Hello"]
        snapshot("PhraseCollection")
    }
    
    
    func testSnapshotPhraseChats() {
        app = XCUIApplication()
        XCUIApplication().tabBars.children(matching: .button).matching(identifier: "Favorites").element(boundBy: 1).tap()

        snapshot("PhraseChats")
    }

}
