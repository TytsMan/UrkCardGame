//
//  StickerPackStoreView.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import SwiftUI

struct StickerPackStoreView: View {
    
    @EnvironmentObject var storeManager: StoreManager
    
    @State var stickerPacks: [StickerPack] = []
    @State var isLoading = false
    
    @State var alertText = ""
    @State var showingAlert = false
    
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
                            Assets.Stickers.Ukrainegame.file111043264.swiftUIImage
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text("**Гроші від купівлі стікерів йдуть до ЗСУ**")
                                .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                                .foregroundColor(Assets.Colors.textColor.swiftUIColor)
                                .multilineTextAlignment(.center)
                            
                            VStack(spacing: 40) {
                                
                                ForEach(Array(stride(from: 0, to: stickerPacks.count, by: 2)), id: \.self) { idx in
                                    HStack(spacing: 40) {
                                        createStickerPackButton(stickerPack: stickerPacks[idx])
                                        if stickerPacks.count > idx {
                                            createStickerPackButton(stickerPack: stickerPacks[idx+1])
                                        }
                                    }
                                }
                            }
                            
                            Button(action: restorePurchases) {
                                ButtonLabel(text: "Відновити покупки")
                            }
                        }
                        .padding(.bottom, 10)
                    }
                }
                .padding(30)
            }
            .background(content: {
                GameBackgroundView()
            })
            .onAppear {
                self.updateProducts()
            }
        }
        .navigationBarHidden(true)
        .alert(alertText, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
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
                                        Text(stickerPack.price)
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
        )
    }
    
    private func updateProducts() {

        isLoading = true
        storeManager.getStickerPackProducts {  result in
            isLoading = false
            switch result {
            case .success(let products):
                let result: [StickerPack] = products.map { product in
                    StickerPackFactory.shared.createStickerPack(for: product)
                }
                self.stickerPacks = result
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func restorePurchases() {
        isLoading = true
        storeManager.restorePurchases { error in
            self.isLoading = false
            if let error = error {
                self.alertText = error.localizedDescription
                self.showingAlert = true
            }
        }
    }
}

struct StickerPackStoreView_Previews: PreviewProvider {
    static var previews: some View {
        StickerPackStoreView()
    }
}
