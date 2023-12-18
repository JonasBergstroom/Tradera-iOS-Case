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
                productImage(for: product)
                Text(product.title)
                    .font(.headline)
                Text("\(product.price) \(product.currency)")
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}

private func productImage(for product: Product) -> some View {
    AsyncImage(url: URL(string: product.image)) { phase in
        switch phase {
        case .success(let image):
            image.resizable().scaledToFit().frame(width: 150, height: 150)
        case .empty:
            Image(systemName: "photo").resizable().scaledToFit().frame(width: 100, height: 100)
        case .failure(_):
            ProgressView()
        @unknown default:
            EmptyView()
        }
    }
}
