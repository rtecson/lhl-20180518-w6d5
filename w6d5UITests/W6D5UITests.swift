//
//  W6D5UITests.swift
//  w6d5UITests
//
//  Created by Roland on 2017-12-13.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

import XCTest

class W6D5UITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStartOnboarding() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Given -- no initial set up required
        
        // When -- start app
        let app = XCUIApplication()

        // Then -- onboarding screen 1 should be displayed
        XCTAssert(app.staticTexts["onboardingScreen1"].label == "Onboarding Screen 1", "Expected to be displaying Onboarding Screen 1")
        
        // When -- swipe left from Onboarding Screen 1
        app.swipeLeft()

        // Then -- onboarding screen 2 should be displayed
        XCTAssert(app.staticTexts["onboardingScreen2"].label == "Onboarding Screen 2", "Expected to be displaying Onboarding Screen 2")
        
        // When -- swipe left from Onboarding Screen 2
        app.swipeLeft()

        // Then -- onboarding screen 3 should be displayed
        XCTAssert(app.staticTexts["onboardingScreen3"].label == "Onboarding Screen 3", "Expected to be displaying Onboarding Screen 3")
        
        // When -- swipe left from Onboarding Screen 3
        app.swipeLeft()
        
        // Then -- no more pages, onboarding screen 3 should still be displayed
        XCTAssert(app.staticTexts["onboardingScreen3"].label == "Onboarding Screen 3", "Expected to be displaying Onboarding Screen 3")
        
        // When -- swipe right from Onboarding Screen 3
        app.swipeRight()

        // Then -- onboarding screen 2 should be displayed
        XCTAssert(app.staticTexts["onboardingScreen2"].label == "Onboarding Screen 2", "Expected to be displaying Onboarding Screen 2")
        
        // When -- swipe right from Onboarding Screen 2
        app.swipeRight()

        // Then -- onboarding screen 1 should be displayed
        XCTAssert(app.staticTexts["onboardingScreen1"].label == "Onboarding Screen 1", "Expected to be displaying Onboarding Screen 1")
        
        // When -- swipe right from Onboarding Screen 1
        app.swipeRight()
        
        // Then -- no more pages, onboarding screen 1 should still be displayed
        XCTAssert(app.staticTexts["onboardingScreen1"].label == "Onboarding Screen 1", "Expected to be displaying Onboarding Screen 1")

        // When -- swipe right until we get to last onboarding screen
        app.swipeLeft()
        app.swipeLeft()
        
        // Then/When -- dismiss button should be displayed, tap it
        validateDismissButtonExistsAndTapIt(app)

        // Then -- main screen should be displayed
        XCTAssert(app.staticTexts["mainScreen"].label == "Main Screen", "Expected Main Screen to be displayed")
        
        MyDataModel.doSomething()

    }
    
    func validateDismissButtonExistsAndTapIt(_ app: XCUIApplication) {
        // Then -- dismiss button should be displayed
        XCTAssert(app.buttons["dismissButton"].exists, "Expected dismiss button to be displayed")
        
        // When -- tap on dismisss button on Onboarding Screen 3
        app.buttons["dismissButton"].tap()
    }
}
