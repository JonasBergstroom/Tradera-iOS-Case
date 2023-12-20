//
//  ProductImageHelper.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-20.
//

import Foundation
import SwiftUI

func productImage(url: String) -> some View {
    AsyncImage(url: URL(string: url)) { phase in
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
