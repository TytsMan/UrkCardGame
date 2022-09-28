//
//  MainButton.swift
//  UrkCardGame
//
//  Created by Ivan on 28/09/2022.
//

import SwiftUI

struct MainButton: View {

    let text: String
    let backgroundColor: Color
    let action: () -> Void
    
    internal init(text: String, backgroundColor: Color = Assets.Colors.primaryColor.swiftUIColor, action: @escaping () -> Void) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .buttonStyle(MainButtonStyle(backgroundColor: backgroundColor))
    }
    
    struct MainButtonStyle: ButtonStyle {
        
        let backgroundColor: Color
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 20))
                .padding(.vertical, 18)
                .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                .background(backgroundColor)
                .cornerRadius(20)
        }
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(text: "MyButton") {
            
        }
    }
}
