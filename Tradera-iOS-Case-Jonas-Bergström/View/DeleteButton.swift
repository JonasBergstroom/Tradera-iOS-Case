//
//  DeleteButton.swift
//  Tradera_iOS_CaseTests
//
//  Created by Jonas Bergström on 2023-12-21.
//

import Foundation
import SwiftUI

struct DeleteButton: View {
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
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
        }
        .padding(.top, 8)
    }
    
    func tap() {
        action()
    }
}
