//
//  DeepLinks.swift
//  UrkCardGame
//
//  Created by Ivan on 06/10/2022.
//

import Foundation
import SwiftUI

func openUrl(string: String) {
    if let url = URL(string: string) {
        UIApplication.shared.open(url)
    }
}
