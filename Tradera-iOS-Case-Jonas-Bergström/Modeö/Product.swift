//
//  Product.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-18.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Int
    let currency: String
    let image: String
}
