//
//  UrkCardGameApp.swift
//  UrkCardGame
//
//  Created by Ivan on 27/09/2022.
//

import SwiftUI
import ApphudSDK

@main
struct UrkCardGameApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .onAppear {
                    Apphud.start(apiKey: Const.AppHud.apiKey)
//                    loadProducts()
                }
        }
    }
    
    func loadProducts() {
        Apphud.paywallsDidLoadCallback { paywalls in
            guard let paywall = paywalls.first else {
                print("No paywalls")
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    loadProducts()
                }
                return
            }
            
            let products = paywall.products
            
            guard let skProduct = products.first?.skProduct else {
                print("No products")
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    loadProducts()
                }
                return
            }
            
            print(skProduct.localizedTitle)
            
        }
    }
}
