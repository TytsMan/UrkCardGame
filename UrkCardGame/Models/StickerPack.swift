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
        if product?.productId == Const.StoreProducts.firstpackukrainegameProductId {
            result = createFirstStickerPack(apphudProduct: product)
        } else if product?.productId == Const.StoreProducts.slavaukraineappgameProductId {
            result = createSecondStickerPack(apphudProduct: product)
        } else {
            result = createFirstStickerPack(apphudProduct: product)
        }
        return result
    }
    
    private func createFirstStickerPack(apphudProduct: ApphudProduct?) -> StickerPack {
        StickerPack(
            id: Const.StoreProducts.firstpackukrainegameProductId,
            cover: Assets.Stickers.Firstpackukrainegame.firstpackCover.name,
            stickers: [
                Assets.Stickers.Firstpackukrainegame.file111068017.name,
                Assets.Stickers.Firstpackukrainegame.file111068018.name,
                Assets.Stickers.Firstpackukrainegame.file111068020.name,
                Assets.Stickers.Firstpackukrainegame.file111068024.name,
                Assets.Stickers.Firstpackukrainegame.file111068033.name,
                Assets.Stickers.Firstpackukrainegame.file111068034.name,
                Assets.Stickers.Firstpackukrainegame.file111068035.name,
                Assets.Stickers.Firstpackukrainegame.file111068038.name
            ],
            url: "https://t.me/addstickers/firstpackukrainegame",
            apphudProduct: apphudProduct
        )
    }
    
    private func createSecondStickerPack(apphudProduct: ApphudProduct?) -> StickerPack {
        StickerPack(
            id: Const.StoreProducts.slavaukraineappgameProductId,
            cover: Assets.Stickers.Slavaukraineappgame.slavaukrainecover.name,
            stickers: [
                Assets.Stickers.Slavaukraineappgame.file111036333.name,
                Assets.Stickers.Slavaukraineappgame.file111036336.name,
                Assets.Stickers.Slavaukraineappgame.file111036341.name,
                Assets.Stickers.Slavaukraineappgame.file111036343.name,
                Assets.Stickers.Slavaukraineappgame.file111036357.name,
                Assets.Stickers.Slavaukraineappgame.file111036363.name,
                Assets.Stickers.Slavaukraineappgame.file111036365.name,
                Assets.Stickers.Slavaukraineappgame.file111036378.name,
                Assets.Stickers.Slavaukraineappgame.file111036382.name
            ],
            url: "https://t.me/addstickers/slavaukraineappgame",
            apphudProduct: apphudProduct
        )
    }
}
