//
//  AlertWrapperTests.swift
//  AlertWrapperTests
//
//  Created by Pedro Alonso on 7/13/17.
//  Copyright © 2017 Pedro Alonso. All rights reserved.
//

import XCTest
@testable import AlertWrapper

class AlertWrapperTests: XCTestCase {
    var alert1: AlertWrapper!
    var alert2: AlertWrapper!
    var alert3: AlertWrapper!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let titleOk = "Ok"
        let titleCancel = "Cancel"
        let alertTitle = "Alert"
        let message = "This is an alert"
        
        let okAction: UIAlertAction = UIAlertAction(title: titleOk, style: .default, handler:
            
            myOKHandler)
        
        let cancelAction = UIAlertAction(title: titleCancel, style: .cancel, handler:
            
            myCancelHandler)
        
        alert1 = AlertWrapper()
        alert1
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        alert1 = nil
        alert2 = nil
        alert3 = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
     
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func myOKHandler(ok: UIAlertAction) {
        print(ok.title!)
    }
    func myCancelHandler(cancel: UIAlertAction) {
        print(cancel.title!)
    }
    
}
