//
//  Tradera_iOS_Case_Jonas_Bergstro_mTests.swift
//  Tradera-iOS-Case-Jonas-BergströmTests
//
//  Created by Jonas Bergström on 2023-12-21.
//

import XCTest
import SwiftUI
@testable import Tradera_iOS_Case_Jonas_Bergström // Replace with the actual module name

class YourTests: XCTestCase {

    func testProductImageSuccess() {
        let url = "https://example.com/image.jpg"
        let asyncImage = productImage(url: url)

        XCTAssertNotNil(asyncImage)
    }

    func testProductImageEmpty() {
        let url = "invalid-url" // An invalid URL to simulate an empty state
        let asyncImage = productImage(url: url)

        XCTAssertNotNil(asyncImage)
    }

    func testProductImageFailure() {
        // This test assumes that the failure case in AsyncImage is triggered by providing a nil URL.
        // You may need to adjust this based on the actual behavior of AsyncImage in your code.
        let url: String? = nil
        let asyncImage = productImage(url: url!)

        XCTAssertNotNil(asyncImage)
    }
}
