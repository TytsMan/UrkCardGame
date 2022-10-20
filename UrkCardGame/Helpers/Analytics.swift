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
    
    static private let numberAppLunchesKey = "numberAppLunchesKey"
    static private let numberReviewRequests = "numberReviewRequestsKey"
    
    private let userDefaults: UserDefaults
    
    private(set) var numberAppLunches: Int {
        get {
            userDefaults.integer(forKey: Analytics.numberAppLunchesKey)
        }
        set {
            userDefaults.set(newValue, forKey: Analytics.numberAppLunchesKey)
        }
    }
    
    private(set) var numberReviewRequests: Int {
        get {
            userDefaults.integer(forKey: Analytics.numberReviewRequests)
        }
        set {
            userDefaults.set(newValue, forKey: Analytics.numberReviewRequests)
        }
    }
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        
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
