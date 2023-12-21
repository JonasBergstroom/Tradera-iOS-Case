//
//  FavoriteProductListView.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-18.
//

import SwiftUI

struct FavoriteProductListView: View {
    @ObservedObject var viewModel = ProductViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.favorites) { product in
                VStack(alignment: .leading, spacing: 8) {
                    productImage(url: product.image)
                    Text(product.title)
                        .font(.headline)
                    Text("\(product.price) \(product.currency)")
                        .foregroundColor(.blue)
                    DeleteButton(isFavorite: viewModel.isFavorite(for: product)) {
                        viewModel.toggleFavorite(for: product)
                    }
                }
                .padding()
            }
        }
        .background(
            Image("favoriteListEmpty")
                .brightness(0.1)
        )
    }
}
