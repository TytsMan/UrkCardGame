//
//  Analytics.swift
//  UrkCardGame
//
//  Created by Ivan on 06/10/2022.
//

import Foundation

class Analytics {
    
    private let openRateViewHandler: (() -> Void)?
    
    init(openRateView: @escaping () -> Void) {
        self.openRateViewHandler = openRateView
    }
    
    func openRateViewIfNeeded() {
        
        var openingCount = UserDefaults.standard.integer(forKey: Const.UserDefaultsKeys.launchCountKey)
        openingCount += 1
        UserDefaults.standard.set(openingCount, forKey:Const.UserDefaultsKeys.launchCountKey)
        
        let numberToOpenRateView = [3, 9, 27]
        
        if numberToOpenRateView.contains(openingCount) {
            openRateViewHandler?()
        }
    }
}
