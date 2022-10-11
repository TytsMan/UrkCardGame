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
    
    var formIsValid: Bool {
        !nickname.isEmpty
    }
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                HStack {
                    BackButton()
                    Spacer()
                }
                selectAvatarView()
                pickNicknameView()
                Spacer()
                
            }
            VStack {
                Assets.PlayersScreen.traktorWithTank.swiftUIImage
                    .resizable()
                    .frame(width: 236, height: 134)
                Button(action: createPlayerAction) {
                    ButtonLabel(text: "Обрати")
                }
                .disabled(!formIsValid)
                .padding(.horizontal, 30)
            }
        }
        .padding(.top, 60)
        .padding(.bottom, 80)
        .padding(.horizontal, 40)
        .background {
            MenuBackgroundView()
        }
        .hiddenNavigationBarStyle()
        .hiddenStatusBarStyle()
    }
    
    func selectAvatarView() -> some View {
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
    }
    
    func pickNicknameView() -> some View {
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
                    .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
            }
            .background(Assets.Colors.accentColor.swiftUIColor)
            .cornerRadius(17)
        }
    }
    
    func createPlayerAction() {
        let newPlayer = Player(
            nickname: self.nickname,
            avatar: avatars[selectedAvatarIdx]
        )
        $players.wrappedValue.append(newPlayer)
        presentationMode.wrappedValue.dismiss()
    }
    
    struct SelectedImage: View {
        
        let image: Image
        
        var body: some View {
            image
                .resizable()
                .frame(width: 91, height: 91)
                .background(Assets.Colors.accentColor.swiftUIColor)
                .clipShape(Circle())
        }
    }
    
    struct UnselectedImage: View {
        
        let image: Image
        
        var body: some View {
            image
                .resizable()
                .background(Assets.Colors.secondaryColor.swiftUIColor)
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
