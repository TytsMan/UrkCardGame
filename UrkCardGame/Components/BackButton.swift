//
//  BackButton.swift
//  UrkCardGame
//
//  Created by Ivan on 28/09/2022.
//

import SwiftUI

struct BackButton: View {
    
    let tintColor: Color
    let action: () -> Void
    
    init(
        tintColor: Color = Assets.Colors.primaryColor.swiftUIColor,
        action: @escaping () -> Void
    ) {
        self.tintColor = tintColor
        self.action = action
    }
    
    var body: some View {
        
        Button(action: action) {
            Assets.Icons.leftArrowCircleFill.swiftUIImage
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .colorMultiply(tintColor)
        }
        
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(tintColor: Assets.Colors.primaryColor.swiftUIColor) {
            
        }
    }
}
