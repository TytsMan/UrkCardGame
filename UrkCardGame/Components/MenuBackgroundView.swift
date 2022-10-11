//
//  MenuBackgroundView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import SwiftUI

struct MenuBackgroundView: View {
    
    let sticker: String?
    
    init(sticker: String? = nil) {
        self.sticker = sticker
    }
    
    var body: some View {
        VStack {
            Assets.Background.patternTop.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            Assets.Background.patternBottom.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .overlay {
            if let sticker = self.sticker {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(sticker)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .background(Assets.Colors.secondaryColor.swiftUIColor)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBackgroundView(sticker: Assets.HomeScreen.shevchenkoWithRpg.name)
    }
}
