//
//  StickerPackStoreView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct StickerPackStoreView: View {
    
    let stickerPacks = [
        StickerPackFactory.shared.createFirstStickerPack(),
        StickerPackFactory.shared.createSecondStickerPack(),
        StickerPackFactory.shared.createThirdStickerPack(),
        StickerPackFactory.shared.createFourthStickerPack()
    ]
    
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
                    VStack(spacing: 40) {
                        Assets.Stickers.Ukrainegame.file111043264.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("**Гроші від купівлі стікерів йдуть до ЗСУ**")
                            .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                            .multilineTextAlignment(.center)
                        
                        VStack(spacing: 40) {
                            HStack(spacing: 40) {
                                createStickerPackButton(stickerPack: stickerPacks[0])
                                createStickerPackButton(stickerPack: stickerPacks[1])
                            }
                            HStack(spacing: 40) {
                                createStickerPackButton(stickerPack: stickerPacks[2])
                                createStickerPackButton(stickerPack: stickerPacks[3])
                            }
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 90)
                    .background {
                        Assets.GameScreen.gameCanvas.swiftUIImage
                            .resizable()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(minHeight: 0, maxHeight: .infinity)
                    }
                }
            }
            .padding(30)
        }
        .background(content: {
            GameBackgroundView()
        })
        .navigationBarHidden(true)
    }
    
    fileprivate func createStickerPackButton(stickerPack: StickerPack) -> some View{
        AnyView(
            NavigationLink(
                destination: StickerPackDetailView(stickerPack: stickerPack),
                label: {
                    Image(stickerPack.cover)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .overlay {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    HStack {
                                        Text("$1.99")
                                            .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 20))
                                            .foregroundColor(Assets.Colors.secondaryColor.swiftUIColor)
                                            .padding(.horizontal, 7)
                                            .padding(.vertical,5)
                                    }
                                    .background(Assets.Colors.accentColor.swiftUIColor)
                                    .cornerRadius(10)
                                    .offset(x: 15, y: 10)
                                }
                            }
                        }
                })
            
//            Button(action: {
//#warning("open sticker pack")
//            }, label: {
//                
//            })
        )
    }
}

struct StickerPackStoreView_Previews: PreviewProvider {
    static var previews: some View {
        StickerPackStoreView()
    }
}
