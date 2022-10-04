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
        ScrollView {
            VStack(spacing: 30) {
                HStack {
                    BackButton(
                        tintColor: Assets.Colors.secondaryColor.swiftUIColor
                    )
                    Spacer()
                }
                VStack {
                    VStack(spacing: 30) {
                        
                        Assets.Stickers.file111042836.swiftUIImage
                        Text("**Правила**")
                            .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                        Text(gameRulesString)
                            .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 20))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 90)
                    .background {
                        Assets.GameScreen.gameCanvas.swiftUIImage
                            .resizable()
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
