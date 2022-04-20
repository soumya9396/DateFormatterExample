//
//  DateViewControllerTest.swift
//  DateFormatterExampleTests
//
//  Created by Soumitra Bera on 20/04/22.
//

import XCTest
@testable import DateFormatterExample

class DateViewControllerTest: XCTestCase {

    var vc: ViewController?
    override func setUp() {
        vc = ViewController()
        debugPrint("Call set up...")
    }

    func test_ConvertDateFormatter_with_ValidData_Returns_ExpectedResult() {
      ///Arrange
        let dateString = "2022-04-12T18:41:20.000000Z"
        let timeZone = "UTC"
        
        ///Act
        let result = vc?.convertDateFormatter(dateStr: dateString, timeZone: timeZone)
        
        ///Asserts
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "2022-April-12 18:41:20")
    }
    
    func test_ConvertDateFormatter_with_InvalidData_Return_InvalidResult() {
        ///Arrange
        let dateString = "2022-04-12T18:41:20"
        let timeZone = "UTC"
        
        ///Act
        let result = vc?.convertDateFormatter(dateStr: dateString, timeZone: timeZone)
        
        ///Asserts
        XCTAssertNotNil(result)
        XCTAssertNotEqual(result, "2022-April-12 18:41:20")
    }
    
    func test_ConvertDateFormatter_with_EmptyData_Return_InvalidResult() {
        ///Arrange
        let dateString = ""
        let timeZone = "UTC"
        
        ///Act
        let result = vc?.convertDateFormatter(dateStr: dateString, timeZone: timeZone)
        
        ///Asserts
        XCTAssert(result == "")
        XCTAssertNotEqual(result, "2022-April-12 18:41:20")
    }
    
    func test_ConvertDateFormatter_with_EmptyTimeZoneData_Return_InvalidResult() {
        ///Arrange
        let dateString = "2022-04-12T18:41:20.000000Z"
        let timeZone = ""
        
        ///Act
        let result = vc?.convertDateFormatter(dateStr: dateString, timeZone: timeZone)
        
        ///Asserts
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "2022-April-13 00:11:20")
        XCTAssertNotEqual(result, "2022-April-12 18:41:20")
    }
    
    override func tearDown() {
        vc = nil
        debugPrint("Call tear down...")
    }

}
