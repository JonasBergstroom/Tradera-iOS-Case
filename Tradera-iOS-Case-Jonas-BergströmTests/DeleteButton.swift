//
//  DeleteButton.swift
//  Tradera_iOS_CaseTests
//
//  Created by Jonas Bergström on 2023-12-21.
//

import XCTest
@testable import Tradera_iOS_Case

class DeleteButtonTest: XCTestCase {
    
    func testFavoriteButtonTapping() {
        var isActionCalled = false
        let favoriteButton = DeleteButton(isFavorite: false) {
            isActionCalled = true
        }
        
        favoriteButton.tap()
        
        XCTAssertTrue(isActionCalled, "Button action should be called")
    }
}
