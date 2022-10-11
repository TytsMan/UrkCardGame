//
//  PlayersListView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import SwiftUI

struct PlayersListView: View {
    
    @Binding var rootIsActive: Bool
    @State var players: [Player] = Player.defaultPlayers
    
    let continueButtonLabel: some View = {
        ButtonLabel(text: "Продовжити")
            .padding(.horizontal, 30)
    }()
    
    var formIsValid: Bool {
        players.count > 1
    }
    
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
                        ForEach((0..<players.count), id: \.self) { idx in
                            PlayerView(player: players[idx]) {
                                players.remove(at: idx)
                            }
                        }
                        NavigationLink(
                            destination: AddPlayerView(players: $players)
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
            if formIsValid {
                NavigationLink(destination: GameView(rootIsActive: $rootIsActive, viewModel: GameViewModel(players: players))) {
                    continueButtonLabel
                }
            } else {
                Button { } label: {
                    continueButtonLabel
                }
            }
            Spacer()
        }
        .padding(.top, 50)
        .padding(.horizontal, 30)
        .padding(.bottom, 80)
        .background {
            MenuBackgroundView(sticker: Assets.PlayersScreen.uaFlagSign.name)
        }
        .hiddenNavigationBarStyle()
        .hiddenStatusBarStyle()
    }
    
    struct PlayerView: View {
        
        let player: Player
        let removeAction: () -> Void
        
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
    
    static let players: [Player] = Player.defaultPlayers
    
    static var previews: some View {
        PlayersListView(rootIsActive: .constant(false),players: players)
    }
}

extension Player {
    static let defaultPlayers = [
        Player(nickname: "Назар", avatar: Assets.Avatars.avatarMale1.name),
        Player(nickname: "Марійка", avatar: Assets.Avatars.avatarFemale1.name)
    ]
}

