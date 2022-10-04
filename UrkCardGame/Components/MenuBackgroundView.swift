//
//  MenuBackgroundView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import SwiftUI

struct MenuBackgroundView: View {
    
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
        .ignoresSafeArea()
        .background(Assets.Colors.secondaryColor.swiftUIColor)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBackgroundView()
    }
}
