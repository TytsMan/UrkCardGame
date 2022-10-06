//
//  StickerPackDetailView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct StickerPackDetailView: View {
    
    let stickerPack: StickerPack
    
    @State var openStickerPackLink = false
    
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
                        Image(stickerPack.cover)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("**В цьому наборі стікерів:**")
                            .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                            .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                            .multilineTextAlignment(.center)
                        
                        VStack(spacing: 40) {
                            ForEach(Array(stride(from: 0, to: stickerPack.stickers.count, by: 2)), id: \.self) { idx in
                                HStack(spacing: 40) {
                                    Image(stickerPack.stickers[idx])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Image(stickerPack.stickers[idx+1])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                        }
                        NavigationLink(isActive: $openStickerPackLink) {
                            StickerPackLinkView(stickerPack: stickerPack)
                        } label: {
                            ButtonLabel(text: "Придбати за $1.99")
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
    }
}

struct StickerPackDetailView_Previews: PreviewProvider {
    
    static let stickerPack = StickerPackFactory.shared.createThirdStickerPack()
    
    static var previews: some View {
        StickerPackDetailView(
            stickerPack: stickerPack
        )
    }
}
