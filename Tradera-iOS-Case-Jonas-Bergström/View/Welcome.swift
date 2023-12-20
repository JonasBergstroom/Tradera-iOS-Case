//
//  Welcome.swift
//  Tradera-iOS-Case-Jonas-Bergström
//
//  Created by Jonas Bergström on 2023-12-20.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Image("traderalogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .background(Image("traderabg"))
                NavigationLink(destination: ContentView()){
                    Text("Start shopping!")
                        .padding(20)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(100)
                }
            }
        }
    }
}
