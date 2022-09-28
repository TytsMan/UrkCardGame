//
//  GameBackgroundView.swift
//  UrkCardGame
//
//  Created by Ivan on 27/09/2022.
//

import SwiftUI

struct GameBackgroundView: View {
    var body: some View {
        HStack {
            Assets.Background.patternLeft.swiftUIImage
            Spacer()
            Assets.Background.patternRight.swiftUIImage
        }
        .ignoresSafeArea()
        .background(Assets.Colors.primaryColor.swiftUIColor)
    }
}

struct GameBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GameBackgroundView()
    }
}
