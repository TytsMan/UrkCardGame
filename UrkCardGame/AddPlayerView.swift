//
//  AddPlayerView.swift
//  UrkCardGame
//
//  Created by Ivan on 27/09/2022.
//

import SwiftUI

struct AddPlayerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var players: [Player]
    
    @State var selectedAvatarIdx: Int = 0
    @State var nickname: String = "Steven"
    
    private let avatars: [String] = [
        "avatar_male_1",
        "avatar_female_1",
        "avatar_female_2",
        "avatar_male_2",
        "avatar_male_3",
        "avatar_male_4"
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
                VStack(alignment: .leading) {
                    HStack {
                        Button {
                            print("back_action")
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("left_arrow_circle_fill")
                                .colorMultiply(Assets.Colors.primaryColor.swiftUIColor)
                        }
                        Spacer()
                    }
                    Text("Оберіть аватар")
                        .font(.system(size: 27))
                    
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
                    
                    Text("Ваше ім’я")
                        .font(.system(size: 27))
                    HStack {
                        Image(avatars[selectedAvatarIdx])
                            .resizable()
                            .frame(width: 31, height: 31, alignment: .center)
                            .padding(.horizontal, 17)
                            .padding(.vertical, 8)
                        TextField("qwertyu", text: $nickname)
                            .padding(.trailing, 10)
                            .font(.system(size: 23))
                            .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                    }
                    .background(Assets.Colors.primaryColor.swiftUIColor)
                    .cornerRadius(17)
                    Spacer()
                    
                }
                VStack {
                    HStack {
                        Spacer()
                        Assets.PlayesScreen.traktor.swiftUIImage
                        Spacer()
                    }
                    HStack {
                        Button("Обрати") {
                            print("Обрати")
                            let newPlayer = Player(
                                nickname: self.nickname,
                                avatar: avatars[selectedAvatarIdx]
                            )
                            $players.wrappedValue.append(newPlayer)
                            presentationMode.wrappedValue.dismiss()
                        }.buttonStyle(SecondaryButtonStyle())
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
                .background(Assets.Colors.primaryColor.swiftUIColor)
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
