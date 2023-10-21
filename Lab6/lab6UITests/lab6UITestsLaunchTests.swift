
//  lab6UITestsLaunchTests.swift
//  lab6UITests
//  Created by 8940891 on 10/20/23.


import XCTest

final class lab6UITestsLaunchTests: XCTestCase 
{

    override class var runsForEachTargetApplicationUIConfiguration: Bool 
    {
        true
    }

    override func setUpWithError() throws 
    {
        continueAfterFailure = false
    }

    func testLaunch() throws 
    {
        let app = XCUIApplication()
        app.launch()


        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
