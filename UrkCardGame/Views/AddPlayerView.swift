//
//  AddPlayerView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import Foundation

import SwiftUI

struct AddPlayerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding private(set) var players: [Player]
    
    @State private var selectedAvatarIdx: Int = 0
    @State private var nickname: String = ""
    
    private let avatars: [String] = [
        Assets.Avatars.avatarMale1.name,
        Assets.Avatars.avatarFemale1.name,
        Assets.Avatars.avatarFemale2.name,
        Assets.Avatars.avatarMale2.name,
        Assets.Avatars.avatarMale3.name,
        Assets.Avatars.avatarMale4.name
    ]
    
    var body: some View {
        ZStack {
            MenuBackgroundView()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("wood_sign")
                }
            }
            .ignoresSafeArea()
            
            VStack() {
                VStack(alignment: .leading, spacing: 30) {
                    HStack {
                        BackButton()
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text("Оберіть аватар")
                            .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 27))
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<avatars.count, id: \.self) { idx in
                                    Button {
                                        selectedAvatarIdx = idx
                                    } label: {
                                        if selectedAvatarIdx == idx {
                                            SelectedImage(image: Image(avatars[idx]))
                                        } else {
                                            UnselectedImage(image: Image(avatars[idx]))
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Ваше ім’я")
                            .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 27))
                            .foregroundColor(.black)
                        HStack {
                            Image(avatars[selectedAvatarIdx])
                                .resizable()
                                .frame(width: 31, height: 31, alignment: .center)
                                .padding(.horizontal, 17)
                                .padding(.vertical, 8)
                            TextField("Напишіть імʼя", text: $nickname)
                                .padding(.trailing, 10)
                                .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 20))
                                .foregroundColor(Assets.whiteColor.swiftUIColor)
                        }
                        .background(Assets.accentColor.swiftUIColor)
                        .cornerRadius(17)
                    }
                    Spacer()
                    
                }
                VStack {
                    HStack {
                        Spacer()
                        Assets.PlayersScreen.traktor.swiftUIImage
                        Spacer()
                    }
                    HStack {
                        Button {
                            let newPlayer = Player(
                                nickname: self.nickname,
                                avatar: avatars[selectedAvatarIdx]
                            )
                            $players.wrappedValue.append(newPlayer)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            ButtonLabel(text: "Обрати")
                        }
                        .disabled(nickname.isEmpty)
                    }
                }
            }
            .padding(.top, 60)
            .padding(.bottom, 80)
            .padding(.horizontal, 40)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    struct SelectedImage: View {
        
        let image: Image
        
        var body: some View {
            image
                .resizable()
                .frame(width: 91, height: 91)
                .background(Assets.accentColor.swiftUIColor)
                .clipShape(Circle())
        }
    }
    
    struct UnselectedImage: View {
        
        let image: Image
        
        var body: some View {
            image
                .resizable()
                .background(Assets.whiteColor.swiftUIColor)
                .frame(width: 91, height: 91)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [4]))
                }
        }
    }
    
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView(players: .constant([]))
    }
}
