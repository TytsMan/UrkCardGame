//
//  HomeView.swift
//  UrkCardGame
//
//  Created by Ivan on 27/09/2022.
//

import SwiftUI

struct HomeView: View {
    
    
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
                        
                        NavigationLink {
                            PlayesListView()
                        } label: {
                            StartGameView()
                                .padding(.horizontal, 50)
                        }
                    }
                    VStack(spacing: 10) {
                        MenuItemView(text: "Отримати стікери")
                        MenuItemView(text: "Паляниця?")
                        MenuItemView(text: "Налаштунки")
                    }
                    .padding(.horizontal, 80)
                }
                .offset(x: 0, y: -50)
            }
            .navigationBarHidden(true)
        }
    }

    struct StartGameView: View {
        
        private let text = "Почати гру!"
        
        var body: some View {
            Text(text)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 35))
                .padding(.vertical, 18)
                .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                .background(Assets.Colors.primaryColor.swiftUIColor)
                .cornerRadius(20)
        }
    }
    
    struct MenuItemView: View {
        
        let text: String
        
        var body: some View {
            Text(text)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 23))
                .padding(.vertical, 18)
                .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                .background(Assets.Colors.primaryColor.swiftUIColor)
                .cornerRadius(20)
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.vertical], 15)
            .padding([.horizontal], 25)
            .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
            .background(Assets.Colors.primaryColor.swiftUIColor)
            .cornerRadius(20)
            .font(.system(size: 36, weight: .semibold))
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.vertical], 15)
            .padding([.horizontal], 25)
            .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
            .background(Assets.Colors.primaryColor.swiftUIColor)
            .cornerRadius(20)
            .font(.system(size: 23))
    }
}

