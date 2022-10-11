//
//  HomeView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var rootPresentation: Bool = false
    @State var pushRateView = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Spacer()
                VStack {
                    Image("greetings")
                    NavigationLink(
                        destination: PlayersListView(rootIsActive: $rootPresentation),
                        isActive: $rootPresentation) {
                            ButtonLabel(
                                text: "Почати гру!",
                                font: FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 35)
                            )
                            .padding(.horizontal, 50)
                        }
                }
                VStack(spacing: 10) {
                    NavigationLink() {
                        StickerPackStoreView()
                    } label: {
                        ButtonLabel(text: "Отримати стікери")
                    }
                    NavigationLink() {
                        GameRulesView()
                    } label: {
                        ButtonLabel(text: "Паляниця?")
                    }
                    NavigationLink() {
                        SettingsView()
                    } label: {
                        ButtonLabel(text: "Налаштунки")
                    }
                    NavigationLink(
                        destination: RateView(),
                        isActive: self.$pushRateView) {
                            EmptyView()
                        }.hidden()
                }
                .padding(.horizontal, 80)
                Spacer()
            }
            .offset(x: 0, y: -50)
        }
        .environment(\.rootPresentation, $rootPresentation)
        .background {
            MenuBackgroundView(sticker: Assets.HomeScreen.shevchenkoWithRpg.name)
        }
        .onAppear {
            let analytics = Analytics {
                pushRateView = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                analytics.openRateViewIfNeeded()
            }
        }
        .hiddenNavigationBarStyle()
        .hiddenStatusBarStyle()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
