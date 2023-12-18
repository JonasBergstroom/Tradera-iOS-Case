//
//  ContentView.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                NavigationView {
                    ProductListView()
                        .navigationBarTitle("Product List")
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Products")
                }

                NavigationView {
                    FavoriteProductListView()
                        .navigationBarTitle("Favorites")
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
