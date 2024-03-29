//
//  ProductListView.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-18.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel = ProductViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            List(viewModel.products) { product in
                VStack(alignment: .leading, spacing: 8) {
                    productImage(url: product.image)
                    Text(product.title)
                        .font(.headline)
                        .foregroundColor(colorScheme == .dark ? .black : .black)
                    Text("\(product.price) \(product.currency)")
                        .foregroundColor(.blue)
                    FavoriteButton(isFavorite: viewModel.isFavorite(for: product)) {
                        viewModel.toggleFavorite(for: product)
                    }
                }
                .background(Image("imagebg"))
                .padding()
            }
    }
}
