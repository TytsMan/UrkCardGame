//
//  RateView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct RateView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                HStack {
                    BackButton(
                        tintColor: Assets.Colors.secondaryColor.swiftUIColor
                    )
                    Spacer()
                }
                CardCanvasView {
                    VStack(spacing: 70) {
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

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView()
    }
}
