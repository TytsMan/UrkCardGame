//
//  Analytics.swift
//  UrkCardGame
//
//  Created by Ivan on 06/10/2022.
//

import Foundation
import StoreKit

protocol AnalyticsProtocol: ObservableObject {
    
    var numberAppLunches: Int { get }
    var numberReviewRequests: Int { get }
    
    func requestReview() -> Bool
}

class Analytics: AnalyticsProtocol {
    
    static private let userDefaults: UserDefaults = UserDefaults(suiteName: "UrkCardGameApp.Analytics")!
    static private let numberAppLunchesKey: String = "numberAppLunchesKey"
    static private let numberReviewRequests: String = "numberReviewRequestsKey"
    
    @UserDefault(Analytics.numberAppLunchesKey, store: Analytics.userDefaults)
    private(set) var numberAppLunches: Int = 0

    @UserDefault(Analytics.numberReviewRequests, store: Analytics.userDefaults)
    private(set) var numberReviewRequests: Int = 0

    init() {
        incrementNumberAppLunches()
    }
    
    @discardableResult
    func requestReview() -> Bool {
        guard numberReviewRequests < 4 else {
            return false
        }
        
        SKStoreReviewController.requestReview()
        incrementNumberReviewRequests()
        return true
    }
    
    private func incrementNumberAppLunches() -> Void {
        numberAppLunches += 1
    }
    
    private func incrementNumberReviewRequests() -> Void {
        numberReviewRequests += 1
    }
}

extension Analytics {
    var isNeedToOpenRateView: Bool {
        [3, 9, 27].contains(numberAppLunches)
    }
}
