//
//  StickerPackDetailView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI
import ApphudSDK

struct StickerPackDetailView: View {
    
    let stickerPack: StickerPack
    
    @State var openStickerPackLink = false
    @State var isLoading = false
    
    var body: some View {
        LoadingView(isShowing: $isLoading) {
            ScrollView {
                VStack(spacing: 30) {
                    HStack {
                        BackButton(
                            tintColor: Assets.Colors.secondaryColor.swiftUIColor
                        )
                        Spacer()
                    }
                    CardCanvasView {
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
                            VStack(spacing: 10) {
                                Button(action: purchaseStickerPack) {
                                    ButtonLabel(text: "Придбати за \(stickerPack.price)")
                                }
                                NavigationLink(isActive: $openStickerPackLink) {
                                    StickerPackLinkView(stickerPack: stickerPack)
                                } label: {
                                    if false {
                                        ButtonLabel(text: "Посилання")
                                    } else {
                                        EmptyView()
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(30)
            }
            .background(content: {
                GameBackgroundView()
            })
        }
        .navigationBarHidden(true)
        
    }
    
    private func purchaseStickerPack() {
        guard let apphudProduct = stickerPack.apphudProduct else {
            return
        }
        
        isLoading = true
        
        Apphud.purchase(apphudProduct) { result in
            isLoading = false
            if let error = result.error {
                print(error.localizedDescription)
            } else if let purchase = result.nonRenewingPurchase,
                      purchase.isActive() {
                self.purchaseSuccess()
            }
        }
    }
    
    private func purchaseSuccess() {
        openStickerPackLink = true
    }
}

struct StickerPackDetailView_Previews: PreviewProvider {
    
    static let stickerPack = StickerPackFactory.shared.createStickerPack()
    
    static var previews: some View {
        StickerPackDetailView(
            stickerPack: stickerPack
        )
    }
}
