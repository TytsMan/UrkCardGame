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
        if let formated = formatter.string(from: self.price) {
            return formated
        } else {
            return "\(self.price)"
        }
    }
}
