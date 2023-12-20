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
        NavigationView {
            List {
                ForEach(viewModel.favorites) { product in
                    VStack(alignment: .leading, spacing: 8) {
                        productList(for: product)
                    }
                    .padding()
                }
                .onDelete(perform: deleteFavorite)
            }
        }
    }

    private func productList(for product: Product) -> some View {
        HStack {
            productImage(for: product)
                .frame(width: 50, height: 50)
                .padding(.trailing, 35)

            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.headline)
                Text("\(product.price) \(product.currency)")
                    .foregroundColor(.blue)
            }
        }
    }

    private func deleteFavorite(at offsets: IndexSet) {
        viewModel.favorites.remove(atOffsets: offsets)
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
