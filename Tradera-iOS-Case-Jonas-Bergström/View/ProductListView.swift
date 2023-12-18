//
//  ProductListView.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-18.
//

import SwiftUI

struct ProductListView: View {
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 8) {
                Text("The product")
                    .font(.headline)
                Text("Information about product")
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}
