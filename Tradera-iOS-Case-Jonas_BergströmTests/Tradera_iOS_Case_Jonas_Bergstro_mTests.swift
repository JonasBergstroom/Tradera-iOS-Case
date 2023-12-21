//
//  Tradera_iOS_Case_Jonas_Bergstro_mTests.swift
//  Tradera-iOS-Case-Jonas_BergströmTests
//
//  Created by Jonas Bergström on 2023-12-21.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import Tradera_iOS_Case_Jonas_Bergström // Replace with your actual app name

class PokedexSwiftUITests: XCTestCase {
    func testContentViewSnapshot() {
        let contentView = ProductListView()
        let hostingController = UIHostingController(rootView: contentView)
        
        assertSnapshot(
            matching: hostingController,
            as: .image(on: .iPhone8)
        )
    }
}
