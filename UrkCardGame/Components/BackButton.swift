//
//  BackButton.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    let tintColor: Color
    let action: (() -> Void)?
    
    init(
        tintColor: Color = Assets.accentColor.swiftUIColor,
        action: (() -> Void)? = nil
    ) {
        self.tintColor = tintColor
        self.action = action
    }
    
    var body: some View {
        
        Button(action: backAction) {
            Assets.Icons.leftArrowCircleFill.swiftUIImage
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .colorMultiply(tintColor)
        }
    }
    
    private func backAction() {
        if let action = action {
            action()
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
