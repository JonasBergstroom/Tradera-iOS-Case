//
//  ViewTest.swift
//  Tradera-iOS-Case-Jonas-BergströmTests
//
//  Created by Jonas Bergström on 2023-12-21.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import Tradera_iOS_Case

class ViewTest: XCTestCase {
    
    func testWelcomeView() {
        let expectation = XCTestExpectation(description: "Welcome screen loaded")

        let welcomeView = Welcome()
        let hostingController = UIHostingController(rootView: welcomeView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)

        assertSnapshot(
            matching: hostingController,
            as: .image(on: .iPhone8)
        )
    }
    
    func testContentView() {
        let contentView = ContentView()
        let hostingController = UIHostingController(rootView: contentView)

        assertSnapshot(
            matching: hostingController,
            as: .image(on: .iPhone8)
        )
    }
    
    func testProductListView() {
        let expectation = XCTestExpectation(description: "Products fetched")

        let productListView = ProductListView()
        let hostingController = UIHostingController(rootView: productListView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
        
        assertSnapshot(
            matching: hostingController,
            as: .image(on: .iPhone8)
        )
    }
    
    func testFavoriteProductListView() {
        let expectation = XCTestExpectation(description: "Favorites fetched")

        let favoriteProductListView = FavoriteProductListView()

        favoriteProductListView.viewModel.favorites = [
            Product(id: 1, title: "Product 1", price: 100, currency: "SEK", image: "product1.jpg"),
            Product(id: 2, title: "Product 2", price: 250, currency: "SEK", image: "product2.jpg"),
            Product(id: 3, title: "Product 3", price: 1000, currency: "SEK", image: "product3.jpg")
        ]

        let hostingController = UIHostingController(rootView: favoriteProductListView)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)

        assertSnapshot(
            matching: hostingController,
            as: .image(on: .iPhone8)
        )
    }
}
