//
//  StoreKit+Extension.swift
//  UrkCardGame
//
//  Created by Ivan on 07/10/2022.
//

import StoreKit

extension SKProduct {
    func getLocalizedPrice()->String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self.priceLocale
        if let formatted = formatter.string(from: self.price) {
            return formatted
        } else {
            return "\(self.price)"
        }
    }
}
