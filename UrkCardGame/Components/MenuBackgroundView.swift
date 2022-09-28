//
//  BackgroundView.swift
//  UrkCardGame
//
//  Created by Ivan on 27/09/2022.
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
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBackgroundView()
    }
}
