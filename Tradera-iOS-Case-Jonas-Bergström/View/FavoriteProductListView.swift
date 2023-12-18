//
//  FavoriteProductListView.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-18.
//

import SwiftUI

struct FavoriteProductListView: View {
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 8) {
                Text("Favorite Title")
                    .font(.headline)
                Text("Favorite Information")
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}

#Preview {
    FavoriteProductListView()
}
