//
//  SettingsView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    BackButton()
                    Spacer()
                }
                .offset(y: 80)
                Assets.Stickers.vseBudeDobre.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .allowsHitTesting(false)
                VStack(spacing: 10) {
                    Button {
                        openUrl(string: Const.termsOfUseUrl)
                    } label: {
                        ButtonLabel(text: "Правила використання")
                    }
                    Button {
                        openUrl(string: Const.privacyPolicyUrl)
                    } label: {
                        ButtonLabel(text: "Конфіденційність")
                    }
                    Button {
                        openUrl(string: Const.contactUsUrl)
                    } label: {
                        ButtonLabel(text: "Звʼязок")
                    }
                    NavigationLink(destination: StickerPackStoreView()) {
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
            .padding(.top, 30)
            .padding(.horizontal, 30)
        }
        .background {
            
            MenuBackgroundView()
        }
        .ignoresSafeArea()
        .hiddenNavigationBarStyle()
        .hiddenStatusBarStyle()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
