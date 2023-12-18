//
//  ProductViewModel.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-18.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        fetchProducts()
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
}
