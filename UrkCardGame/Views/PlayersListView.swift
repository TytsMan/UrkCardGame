//
//  PlayersListView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import SwiftUI

struct PlayersListView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var players: [Player] = [
        Player(nickname: "Назар", avatar: Assets.Avatars.avatarMale1.name),
        Player(nickname: "Марійка", avatar: Assets.Avatars.avatarFemale1.name)
    ]
    
    var body: some View {
        ZStack {
            MenuBackgroundView()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Assets.PlayersScreen.uaFlagSign.swiftUIImage
                }
            }
            .ignoresSafeArea()
            VStack() {
                VStack(alignment: .leading) {
                    HStack {
                        BackButton()
                        Spacer()
                    }
                    Text("Додайте гравців")
                        .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 27))
                        .foregroundColor(Color.black)
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach((0..<players.count), id: \.self) { idx in
                                PlayerView(player: players[idx]) {
                                    players.remove(at: idx)
                                }
                            }
                            NavigationLink(destination: AddPlayerView(players: $players)) {
                                NewPlayerView()
                            }
                        }
                    }
                }
                Spacer()
                Assets.PlayersScreen.traktor.swiftUIImage
                if self.players.count > 1 {
                    NavigationLink(destination: GameView(rootIsActive: $rootIsActive, viewModel: GameViewModel(players: players))) {
                        ButtonLabel(text: "Продовжити")
                            .frame(width: 300, alignment: .center)
                    }
                } else {
                    Button {
                        
                    } label: {
                        ButtonLabel(text: "Продовжити")
                            .frame(width: 300, alignment: .center)
                    }
                }
            }
            .padding(.top, 60)
            .padding(.bottom, 80)
            .padding(.horizontal, 40)
        }
        .navigationBarHidden(true)
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
                    .padding(.trailing, 50)
                    .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
            }
            .padding(.vertical, 8)
            .background(Assets.Colors.accentColor.swiftUIColor)
            .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
            .cornerRadius(17)
        }
    }
}

struct PlayesListView_Previews: PreviewProvider {
    
    static let players: [Player] = [
        Player(nickname: "Johny", avatar: Assets.Avatars.avatarMale1.name),
        Player(nickname: "Dave", avatar: Assets.Avatars.avatarMale2.name),
        //        Player(nickname: "Leon", avatar: Assets.Avatars.avatarMale3.name),
        //        Player(nickname: "Said", avatar: Assets.Avatars.avatarMale4.name),
        Player(nickname: "Mary", avatar: Assets.Avatars.avatarFemale1.name),
        Player(nickname: "Elizabeth", avatar: Assets.Avatars.avatarFemale2.name)
    ]
    
    static var previews: some View {
        PlayersListView(rootIsActive: .constant(false),players: players)
    }
}

