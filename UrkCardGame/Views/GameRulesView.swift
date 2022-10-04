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
    -Граєш з друзями
    -Відповідаєш на питання,міняєшся
    -В разі неправильної відповіді, або через брак часу, ти повинен виконати завдання
    -І пам’ятай головне “русня -ху*ня”
    """
    
    var body: some View {
        ZStack {
            Assets.GameScreen.gameCanvas.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 30)
                .overlay {
                    VStack {
                        Assets.Stickers.file111042836.swiftUIImage
                        Text("**Правила**")
                            .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                        Text(gameRulesString)
                            .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 20))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                        Button {
                            
                        } label: {
                            ButtonLabel(text: "Зрозуміло")
                        }

                    }
                    .padding(.horizontal, 60)
                }
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