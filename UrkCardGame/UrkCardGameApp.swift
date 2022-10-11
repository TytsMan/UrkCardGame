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
    
    let storeManager: StoreManager = AppHudStoreManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(storeManager)
        }
    }
    
}
