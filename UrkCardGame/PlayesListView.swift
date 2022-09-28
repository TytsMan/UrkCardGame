//
//  PlayesListView.swift
//  UrkCardGame
//
//  Created by Ivan on 27/09/2022.
//

import SwiftUI

struct PlayesListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var players: [Player] = []
    
    var body: some View {
        ZStack {
            MenuBackgroundView()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Assets.PlayesScreen.woodSign.swiftUIImage
                }
            }
            .ignoresSafeArea()
            VStack() {
                VStack(alignment: .leading) {
                    HStack {
                        BackButton() {
                            presentationMode.wrappedValue.dismiss()
                        }
                        Spacer()
                    }
                    Text("Додайте гравців")
                        .font(.system(size: 27))
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach((0..<players.count), id: \.self) { idx in
                                PlayerView(player: players[idx]) {
                                    players.remove(at: idx)
                                }
                            }
                            
                            NavigationLink(destination: AddPlayerView(players: $players)) {
//                                Button {
//                                    print("add player")
//
//                                } label: {
                                    HStack {
                                        Assets.Icons.plusCircleFill.swiftUIImage
                                            .padding(.horizontal, 17)
                                        Text("Додати гравця")
                                            .font(.system(size: 21))
                                            .padding(.trailing, 50)
                                    }
                                    .padding(.vertical, 8)
                                    .background(Assets.Colors.primaryColor.swiftUIColor)
                                    .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                                    .cornerRadius(17)
                                    
//                                }
                            }
                            
                            
                        }
                    }
                }
                
                
                Spacer()
                Assets.PlayesScreen.traktor.swiftUIImage
                NavigationLink {
                    GameView(viewModel: GameViewModel(players: players))
                } label: {
                    HomeView.MenuItemView(text: "Продовжити")
                        .frame(width: 300, alignment: .center)
                }
                .disabled(players.count < 2)

            }
            .padding(.top, 60)
            .padding(.bottom, 80)
            .padding(.horizontal, 40)
            
            
        }
        .navigationBarHidden(true)
        
    }
    
    struct PlayerView: View {
        
        let player: Player
        
        var removeAction: () -> Void
        
        var body: some View {
            HStack {
                Image("\(player.avatar)")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 17)
                
                Text(player.nickname)
                    .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                    .font(.system(size: 21))
                Spacer()
                
                Button(action: removeAction) {
                    Image("subtract")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .colorMultiply(.white)
                        .padding(.horizontal, 17)
                }
                
            }
            .background(Assets.Colors.primaryColor.swiftUIColor)
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
        PlayesListView(players: players)
    }
}

