//
//  ContentView.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            TabView {
                NavigationView {
                    ProductListView(viewModel: viewModel)
                        .navigationTitle("Product List")
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                VStack(alignment: .leading) {
                                    Text("Click on product to add/remove favorite")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Products")
                }

                NavigationView {
                    FavoriteProductListView(viewModel: viewModel)
                        .navigationTitle("Favorites")
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                VStack(alignment: .leading) {
                                    Text("Swipe to remove favorite")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
