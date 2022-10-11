//
//  GameRulesView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct GameRulesView: View {
    
    private let gameRulesTitle = "Правила"
    private let gameRulesDescription = """
    Правила гри дуже прості:
    
    - Граєш з друзями
    - Відповідаєш на питання, міняєшся
    - В разі неправильної відповіді, або через брак часу, ти повинен виконати завдання
    """
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 30) {
                HStack {
                    BackButton(
                        tintColor: Assets.Colors.secondaryColor.swiftUIColor
                    )
                    Spacer()
                }
                CardCanvasView {
                    VStack(spacing: 30) {
                        Assets.Stickers.vseBudeDobre.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text(gameRulesTitle)
                            .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                        
                        Text(gameRulesDescription)
                            .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 20))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding(30)
        }
        .background {
            GameBackgroundView()
        }
        .hiddenNavigationBarStyle()
        .hiddenStatusBarStyle()
    }
}

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView()
    }
}
