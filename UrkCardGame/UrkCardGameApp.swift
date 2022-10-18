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
    let gameEngine = CardGameEngine(gameDataProvider: GameDataProvider())
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(storeManager)
            .environmentObject(gameEngine)
            .onAppear {
                Player.defaultPlayers.forEach { player in
                    gameEngine.addPlayer(player)
                }
            }
        }
    }
    
}
