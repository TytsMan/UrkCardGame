//
//  StickerPack.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import Foundation
import ApphudSDK

struct StickerPack {
    
    let id: String
    let cover: String
    let stickers: [String]
    let url: String
    let apphudProduct: ApphudProduct?
    
    var price: String {
        apphudProduct?.skProduct?.getLocalizedPrice() ?? "0.0 $"
    }
//    var owned: Bool = false {
//        apphudProduct.h
//    }
    
    
    init(
        id: String,
        cover: String,
        stickers: [String],
        url: String,
        apphudProduct: ApphudProduct?
    ) {
        self.id = id
        self.cover = cover
        self.stickers = stickers
        self.url = url
        self.apphudProduct = apphudProduct
    }
    
}

class StickerPackFactory {
    
    static let shared = StickerPackFactory()
    
    func createStickerPack(for product: ApphudProduct? = nil) -> StickerPack {
        var result: StickerPack
        
        if product?.productId == Const.StoreProducts.ukraineGameProductId {
            result = createFirstStickerPack(apphudProduct: product)
        } else if product?.productId == Const.StoreProducts.ukraineGameStickersProductId {
            result = createSecondStickerPack(apphudProduct: product)
        } else {
            result = createFirstStickerPack(apphudProduct: product)
        }
        
        return result
    }
    
    private func createFirstStickerPack(apphudProduct: ApphudProduct?) -> StickerPack {
        StickerPack(
            id: Const.StoreProducts.ukraineGameProductId,
            cover: Assets.Stickers.Ukrainegame.ukrainegamePromo.name,
            stickers: [
                Assets.Stickers.Ukrainegame.file111043260.name,
                Assets.Stickers.Ukrainegame.file111043262.name,
                Assets.Stickers.Ukrainegame.file111043263.name,
                Assets.Stickers.Ukrainegame.file111043264.name,
                Assets.Stickers.Ukrainegame.file111043266.name,
                Assets.Stickers.Ukrainegame.file111043267.name,
                Assets.Stickers.Ukrainegame.file111043268.name,
                Assets.Stickers.Ukrainegame.file111043269.name,
                Assets.Stickers.Ukrainegame.file111043270.name,
                Assets.Stickers.Ukrainegame.file111043272.name
            ],
            url: "https://t.me/addstickers/ukrainegame",
            apphudProduct: apphudProduct
        )
    }
    
    private func createSecondStickerPack(apphudProduct: ApphudProduct?) -> StickerPack {
        StickerPack(
            id: Const.StoreProducts.ukraineGameProductId,
            cover: Assets.Stickers.Gameukrainestickers.gameukrainestickersPromo.name,
            stickers: [
                Assets.Stickers.Gameukrainestickers.file111042826.name,
                Assets.Stickers.Gameukrainestickers.file111042828.name,
                Assets.Stickers.Gameukrainestickers.file111042829.name,
                Assets.Stickers.Gameukrainestickers.file111042830.name,
                Assets.Stickers.Gameukrainestickers.file111042831.name,
                Assets.Stickers.Gameukrainestickers.file111042835.name,
                Assets.Stickers.Gameukrainestickers.file111042836.name,
                Assets.Stickers.Gameukrainestickers.file111042838.name,
                Assets.Stickers.Gameukrainestickers.file111042847.name,
                Assets.Stickers.Gameukrainestickers.file111042849.name,
                Assets.Stickers.Gameukrainestickers.file111042851.name,
                Assets.Stickers.Gameukrainestickers.file111042853.name,
                Assets.Stickers.Gameukrainestickers.file111042854.name,
                Assets.Stickers.Gameukrainestickers.file111042855.name,
                Assets.Stickers.Gameukrainestickers.file111042857.name,
                Assets.Stickers.Gameukrainestickers.file111042866.name,
                Assets.Stickers.Gameukrainestickers.file111042867.name,
                Assets.Stickers.Gameukrainestickers.file111042869.name,
                Assets.Stickers.Gameukrainestickers.file111042871.name,
                Assets.Stickers.Gameukrainestickers.file111042873.name,
                Assets.Stickers.Gameukrainestickers.file111042881.name,
                Assets.Stickers.Gameukrainestickers.file111042883.name
            ],
            url: "https://t.me/addstickers/gameukrainestickers",
            apphudProduct: apphudProduct
        )
    }
}
