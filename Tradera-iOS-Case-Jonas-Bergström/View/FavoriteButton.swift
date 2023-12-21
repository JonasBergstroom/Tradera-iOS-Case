//
//  FavoriteButton.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-20.
//

import Foundation
import SwiftUI

struct FavoriteButton: View {
    @State private var isTapped: Bool
    var action: () -> Void
    
    init(isFavorite: Bool, action: @escaping () -> Void) {
        self._isTapped = State(initialValue: isFavorite)
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                isTapped.toggle()
            }
            action()
        }) {
            Image(systemName: isTapped ? "heart.fill" : "heart")
                .foregroundColor(isTapped ? .red : .gray)
        }
        .padding(.top, 8)
    }
}
