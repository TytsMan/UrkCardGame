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
    let analytics = Analytics()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(storeManager)
            .environmentObject(gameEngine)
            .environmentObject(analytics)
            .onAppear {
                gameEngine.populateDefaultPlayers()
            }
        }
    }
}

fileprivate extension CardGameEngine {
    
    func populateDefaultPlayers() -> Void {
        Player.defaultPlayers.forEach { player in
            addPlayer(player)
        }
    }
}
