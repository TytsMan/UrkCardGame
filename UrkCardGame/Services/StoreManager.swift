//
//  StoreManager.swift
//  UrkCardGame
//
//  Created by Ivan on 07/10/2022.
//

import Foundation
import StoreKit
import ApphudSDK

enum StoreManagerError: Error {
    
    case NoProducts
    
}

class StoreManager: ObservableObject {
    
    func getStickerPackProducts(completion: @escaping (Result<[ApphudProduct], Error>) -> Void) {
        assertionFailure("Method should be overriden")
    }
    
    func restorePurchases(completion: @escaping (Bool) -> Void) -> Void {
        assertionFailure("Method should be overriden")
    }
}

class AppHudStoreManager: StoreManager {
    
    override init() {
        super.init()
        Apphud.start(apiKey: Const.AppHud.apiKey)
        fetchProducts()
    }
    
    private func fetchProducts(completion: (() -> Void)? = nil) {
        Apphud.paywallsDidLoadCallback { [completion] _ in
            completion?()
        }
    }
    
    override func getStickerPackProducts(completion: @escaping (Result<[ApphudProduct], Error>) -> Void) {
        
        Apphud.paywallsDidLoadCallback { _ in
            
            guard let permGroup = Apphud.permissionGroups.first(where: { group in
                group.name == Const.AppHud.stickerPackGroup
            }) else {
                completion(.failure(StoreManagerError.NoProducts))
                return
            }
            
            let products = permGroup.products
            
            guard !products.isEmpty else {
                completion(.failure(StoreManagerError.NoProducts))
                return
            }
            
            completion(.success(products))
        }
    }
    
    override func restorePurchases(completion: @escaping (Bool) -> Void) -> Void {
        Apphud.restorePurchases { _, _, error in
            completion(error == nil)
        }
    }
}

