//
//  SettingsView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            MenuBackgroundView()
            VStack {
                HStack {
                    BackButton()
                    Spacer()
                }
                .offset(y: 80)
                Assets.Stickers.vseBudeDobre.swiftUIImage
                VStack(spacing: 10) {
                    Button {
                        #warning("open Terms of use page")
                    } label: {
                        ButtonLabel(text: "Правила використання")
                    }
                    Button {
                        #warning("open Privacy&Policy page")
                    } label: {
                        ButtonLabel(text: "Конфіденційність")
                    }
                    Button {
                        #warning("Donate ZSU")
                    } label: {
                        VStack(spacing: 0) {
                            Assets.Colors.accentColor.swiftUIColor
                                .frame(height: 55)
                            Assets.Colors.yellowColor.swiftUIColor
                                .frame(height: 55)
                        }
                        .cornerRadius(15)
                        .overlay {
                            Text("Допомогти \n ЗСУ")
                                .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 32))
                                .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                        }
                    }

                }
            }
            .padding(.horizontal, 30)
            .offset(y: -40)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
