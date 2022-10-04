//
//  StickerPack.swift
//  UrkCardGame
//
//  Created by Ivan on 04/10/2022.
//

import Foundation

struct StickerPack {
    
    let cover: String
    let stickers: [String]
    let url: String
    
}

class StickerPackFactory {
    
    static let shared = StickerPackFactory()
    
    func createFirstStickerPack() -> StickerPack {
        StickerPack(
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
            url: "https://t.me/addstickers/ukrainegame"
        )
    }
    
    func createSecondStickerPack() -> StickerPack {
        StickerPack(
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
            url: "https://t.me/addstickers/gameukrainestickers"
        )
    }
    
    func createThirdStickerPack() -> StickerPack {
        StickerPack(
            cover: Assets.Stickers.Russiasuckk.russiasuckkPromo.name,
            stickers: [
                Assets.Stickers.Russiasuckk.file111036333.name,
                Assets.Stickers.Russiasuckk.file111036336.name,
                Assets.Stickers.Russiasuckk.file111036341.name,
                Assets.Stickers.Russiasuckk.file111036343.name,
                Assets.Stickers.Russiasuckk.file111036346.name,
                Assets.Stickers.Russiasuckk.file111036348.name,
                Assets.Stickers.Russiasuckk.file111036351.name,
                Assets.Stickers.Russiasuckk.file111036353.name,
                Assets.Stickers.Russiasuckk.file111036356.name,
                Assets.Stickers.Russiasuckk.file111036357.name,
                Assets.Stickers.Russiasuckk.file111036360.name,
                Assets.Stickers.Russiasuckk.file111036363.name,
                Assets.Stickers.Russiasuckk.file111036365.name,
                Assets.Stickers.Russiasuckk.file111036369.name,
                Assets.Stickers.Russiasuckk.file111036371.name,
                Assets.Stickers.Russiasuckk.file111036373.name,
                Assets.Stickers.Russiasuckk.file111036375.name,
                Assets.Stickers.Russiasuckk.file111036378.name,
                Assets.Stickers.Russiasuckk.file111036381.name,
                Assets.Stickers.Russiasuckk.file111036382.name
            ],
            url: "https://t.me/addstickers/rusniahuinia"
        )
    }
    
    func createFourthStickerPack() -> StickerPack {
        StickerPack(
            cover: Assets.Stickers.Rusniahuinia.rusniahuiniaPromo.name,
            stickers: [
                Assets.Stickers.Rusniahuinia.file111036703.name,
                Assets.Stickers.Rusniahuinia.file111036709.name,
                Assets.Stickers.Rusniahuinia.file111036714.name,
                Assets.Stickers.Rusniahuinia.file111036723.name,
                Assets.Stickers.Rusniahuinia.file111036734.name,
                Assets.Stickers.Rusniahuinia.file111036751.name,
                Assets.Stickers.Rusniahuinia.file111036760.name,
                Assets.Stickers.Rusniahuinia.file111036767.name,
                Assets.Stickers.Rusniahuinia.file111036670.name,
                Assets.Stickers.Rusniahuinia.file111036673.name,
                Assets.Stickers.Rusniahuinia.file111036675.name,
                Assets.Stickers.Rusniahuinia.file111036680.name,
                Assets.Stickers.Rusniahuinia.file111036683.name,
                Assets.Stickers.Rusniahuinia.file111036686.name,
                Assets.Stickers.Rusniahuinia.file111036691.name,
                Assets.Stickers.Rusniahuinia.file111036695.name
            ],
            url: "https://t.me/addstickers/russiasuckk"
        )
    }
}
