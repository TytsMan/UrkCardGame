//
//  ViewModifiers.swift
//  UrkCardGame
//
//  Created by Ivan on 11/10/2022.
//

import SwiftUI

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct HiddenStatusBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .statusBarHidden()
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
    
    func hiddenStatusBarStyle() -> some View {
        modifier( HiddenStatusBar() )
    }
}
