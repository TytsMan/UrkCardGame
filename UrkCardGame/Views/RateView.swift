//
//  RateView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct RateView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                HStack {
                    BackButton(
                        tintColor: Assets.Colors.secondaryColor.swiftUIColor
                    )
                    Spacer()
                }
                .padding(.horizontal, 30)
                Assets.GameScreen.gameCanvas.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 30)
                    .overlay {
                        VStack(spacing: 40) {
                            Assets.Stickers.pesuk.swiftUIImage
                            VStack(spacing: 10) {
                                Text("**Вам подобається Українська гра?**")
                                    .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                                    .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                                Text("Підтримайте команду українських розробників оцінкою в AppStore! Дуже вдячні, Слава Україні.")
                                    .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 20))
                                    .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                            }
                            .multilineTextAlignment(.center)
                            Button {
    #warning("Rate me code")
                            } label: {
                                ButtonLabel(text: "Оцінити")
                            }
                        }
                        .padding(.horizontal, 60)
                }
            }
            
        }
        .background(content: {
            GameBackgroundView()
        })
        .navigationBarHidden(true)
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView()
    }
}
