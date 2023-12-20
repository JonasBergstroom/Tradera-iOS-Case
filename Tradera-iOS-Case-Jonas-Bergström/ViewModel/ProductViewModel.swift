//
//  ProductViewModel.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-18.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var favorites: [Product] = []

    init() {
        fetchProducts()
        fetchFavorites()
    }
    
    func fetchFavorites() {
            guard let data = UserDefaults.standard.data(forKey: "Favorite"),
                  let savedFavorite = try? JSONDecoder().decode([Product].self, from: data) else { favorites = []; return }
            favorites = savedFavorite
        }

    func fetchProducts() {
        let url = "https://www.tradera.com/static/images/NO_REV/frontend-task/ProductFeedResult.json"
        
        let request = URLRequest(url: URL(string: url)!)
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, res, _) in
            guard let jsonData = data else {return}
            
            // Sets the url and makes the request for it
            
            let response = res as! HTTPURLResponse
            
            // To get the statusCode 200
            
            if response.statusCode == 200 {
                do {
                    let response = try JSONDecoder().decode(ProductList.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.products = response.products
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            } else {
                print("error with API")
            }
        }
        .resume()
    }
    
    func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: "Favorite")
        }
        fetchFavorites()
        objectWillChange.send()
    }

    func toggleFavorite(for product: Product) {
        let currentFavoriteState = isFavorite(for: product)
 
        if !currentFavoriteState {
            favorites.append(product)
        } else {
            favorites.removeAll { $0.id == product.id }
        }
        saveFavorites()
   }
    
    func isFavorite(for product: Product) -> Bool {
        return favorites.contains { $0.id == product.id }
    }
}
