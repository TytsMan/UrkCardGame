//
//  ButtonLabel.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import Foundation
import SwiftUI

struct ButtonLabel: View {
    
    let text: String
    let font: SwiftUI.Font
    let backgroundColor: Color
    
    init(
        text: String,
        font: SwiftUI.Font = FontFamily.SFCompactRounded.medium.swiftUIFont(size: 20),
        backgroundColor: Color = Assets.Colors.accentColor.swiftUIColor
    ) {
        self.text = text
        self.font = font
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Text(text)
            .font(font)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 18)
            .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
            .background(backgroundColor)
            .cornerRadius(20)
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(text: "ButtonLabel")
    }
}
