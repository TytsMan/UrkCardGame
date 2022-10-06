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
        NavigationView {
            ZStack {
                MenuBackgroundView()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Assets.HomeScreen.shevchenkoWithRpg.swiftUIImage
                    }
                }
                .ignoresSafeArea()
                VStack(spacing: 30) {
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
                }
                .offset(x: 0, y: -50)
            }
            .navigationBarHidden(true)
            
        }
        .environment(\.rootPresentation, $rootPresentation)
        .statusBar(hidden: true)
        .onAppear {
            let analytics = Analytics {
                pushRateView = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                analytics.openRateViewIfNeeded()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
