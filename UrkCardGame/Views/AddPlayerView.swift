//
//  AddPlayerView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import Foundation

import SwiftUI

struct AddPlayerView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var gameEngine: CardGameEngine
    
    @State private var selectedAvatarIdx: Int = 0
    @State private var nickname: String = ""
    
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
        .padding(EdgeInsets(top: 50, leading: 30, bottom: 80, trailing: 30))
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
                    ForEach(0..<Player.definedAvatars.count, id: \.self) { idx in
                        Button {
                            selectedAvatarIdx = idx
                        } label: {
                            if selectedAvatarIdx == idx {
                                SelectedImage(image: Image(Player.definedAvatars[idx]))
                            } else {
                                UnselectedImage(image: Image(Player.definedAvatars[idx]))
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
                Image(Player.definedAvatars[selectedAvatarIdx])
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
            avatar: Player.definedAvatars[selectedAvatarIdx]
        )
        gameEngine.addPlayer(newPlayer)
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
        AddPlayerView()
            .environmentObject(CardGameEngine.stub)
    }
}
