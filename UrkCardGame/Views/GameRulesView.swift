//
//  GameRulesView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct GameRulesView: View {
    
    let gameRulesString = """
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
                        Text("**Правила**")
                            .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                        Text(gameRulesString)
                            .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 20))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding(30)
        }
        .background(content: {
            GameBackgroundView()
        })
        .navigationBarHidden(true)
    }
}

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView()
    }
}
