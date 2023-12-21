//
//  FavoriteButtonTests.swift
//  Tradera_iOS_CaseTests
//
//  Created by Jonas Bergström on 2023-12-21.
//

import XCTest
@testable import Tradera_iOS_Case

class FavoriteButtonTests: XCTestCase {
    
    func testFavoriteButtonTapping() {
        var isActionCalled = false
        let favoriteButton = FavoriteButton(isFavorite: false) {
            isActionCalled = true
        }
        
        favoriteButton.tap()
        
        XCTAssertTrue(isActionCalled, "Button action should be called")
    }
}
