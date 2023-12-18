//
//  ProductListView.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-18.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel = ProductViewModel()

    var body: some View {
        List(viewModel.products) { product in
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.headline)
                Text("\(product.price) \(product.currency)")
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}
