//
//  PlayersListView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import SwiftUI

struct PlayersListView: View {
    
    @EnvironmentObject private var gameEngine: CardGameEngine
    
    @Binding var rootIsActive: Bool
    
    var formIsValid: Bool {
        gameEngine.canStart
    }
    
    let continueButtonLabel: some View = {
        ButtonLabel(text: "Продовжити")
            .padding(.horizontal, 30)
    }()
    
    var body: some View {
        VStack() {
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    BackButton()
                    Spacer()
                }
                Text("Додайте гравців")
                    .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 27))
                    .foregroundColor(Color.black)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(gameEngine.players) { player in
                            PlayerView(player: player)
                        }
                        NavigationLink(
                            destination: AddPlayerView()
                        ) {
                            NewPlayerView()
                        }
                    }
                }
                
            }
            Spacer()
            Assets.PlayersScreen.traktorWithTank.swiftUIImage
                .resizable()
                .frame(width: 236, height: 134)
            /// to avoid creating vm without players
            if gameEngine.canStart {
                NavigationLink(destination: GameView(rootIsActive: $rootIsActive)) {
                    continueButtonLabel
                }
            } else {
                Button { } label: {
                    continueButtonLabel
                }
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 50, leading: 30, bottom: 80, trailing: 30))
        .background {
            MenuBackgroundView(sticker: Assets.PlayersScreen.uaFlagSign.name)
        }
        .onAppear {
            gameEngine.restart()
        }
        .hiddenNavigationBarStyle()
        .hiddenStatusBarStyle()
    }
    
    struct PlayerView: View {
        
        @EnvironmentObject var gameEngine: CardGameEngine
        
        let player: Player
        
        var body: some View {
            HStack {
                Image("\(player.avatar)")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 17)
                Text(player.nickname)
                    .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                    .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 20))
                Spacer()
                Button(action: removeAction) {
                    Assets.Icons.subtract.swiftUIImage
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        .colorMultiply(.white)
                        .padding(.horizontal, 17)
                }
            }
            .background(Assets.Colors.accentColor.swiftUIColor)
            .cornerRadius(17)
        }
        
        private func removeAction() {
            gameEngine.removePlayer(player)
        }
    }
    
    struct NewPlayerView: View {
        var body: some View {
            HStack {
                Assets.Icons.plusCircleFill.swiftUIImage
                    .padding(.horizontal, 17)
                Text("Додати гравця")
                    .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 20))
                    .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                    .padding(.trailing, 50)
            }
            .padding(.vertical, 8)
            .background(Assets.Colors.accentColor.swiftUIColor)
            .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
            .cornerRadius(17)
        }
    }
}

struct PlayesListView_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayersListView(rootIsActive: .constant(false))
            .environmentObject(CardGameEngine.stub)
    }
}
