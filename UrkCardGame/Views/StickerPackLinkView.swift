//
//  StickerPackLinkView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct StickerPackLinkView: View {
    
    let stickerPack: StickerPack
    
    let instructionsString = """
    Щоб встановити набір стікерів Telegram:
    
    - скопіюйте посилання на набір та введіть його в Telegram або вашому браузері
    
    - чи натисніть на кнопку автоматичного встановлення
    """
    
    @State var stickerPackUrl: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                HStack {
                    BackButton(
                        tintColor: Assets.Colors.secondaryColor.swiftUIColor
                    )
                    Spacer()
                }
                VStack {
                    VStack(spacing: 30) {
                        Assets.Stickers.file111042836.swiftUIImage
                        VStack(spacing: 10) {
                            Text("**Успішно**")
                                .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                                .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                                .multilineTextAlignment(.center)
                            
                            Text(instructionsString)
                                .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 20))
                                .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                                .multilineTextAlignment(.leading)
                        }
                        TextField("", text: $stickerPackUrl)
                            .font(FontFamily.SFCompactRounded.regular.swiftUIFont(size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                            .padding(.vertical, 10)
                            .background(Assets.Colors.accentColor.swiftUIColor.opacity(0.3))
                            .cornerRadius(10)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.blue, lineWidth: 2)
                                )
                            .transition(.opacity)
                            .disabled(true)
                            .onTapGesture {
                                UIPasteboard.general.string = stickerPack.url
                                stickerPackUrl = "Скопійовано до буферу."
                                DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                                    stickerPackUrl = stickerPack.url
                                }
                            }
                        Button {
                            #warning("open sticker link")
                            
                            if let url = URL(string: stickerPack.url) {
                                UIApplication.shared.open(url)
                            }
                        } label: {
                            ButtonLabel(text: "Встановити стікери")
                        }
                    }
                    .padding(30)
                    .background {
                        Assets.Colors.secondaryColor.swiftUIColor
                    }
                    .cornerRadius(30)
                }
            }
            .padding(30)
        }
        .background(content: {
            GameBackgroundView()
        })
        .navigationBarHidden(true)
        .onAppear {
            stickerPackUrl = stickerPack.url
        }
    }
}

struct Stc_Previews: PreviewProvider {
    
    static let stickerPack = StickerPackFactory.shared.createThirdStickerPack()
    
    static var previews: some View {
        StickerPackLinkView(stickerPack: stickerPack)
    }
}
