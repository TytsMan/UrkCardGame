//
//  CardCanvasView.swift
//  UrkCardGame
//
//  Created by Ivan on 06/10/2022.
//

import SwiftUI

protocol ContainerView: View {
    associatedtype Content
    init(content: @escaping () -> Content)
}

struct CardCanvasView<Content: View>: ContainerView {
    var content: () -> Content
    
    let cornerRadius: CGFloat = 30.0
    
    var body: some View {
        VStack(content: content)
            .padding(30)
            .background(Assets.Colors.secondaryColor.swiftUIColor)
            .cornerRadius(cornerRadius)
            .background {
                ZStack {
                    Assets.Colors.secondaryColor.swiftUIColor
                        .opacity(0.3)
                        .cornerRadius(cornerRadius)
                        .scaleEffect(x: 0.98)
                        .offset(y: 15)
                    Assets.Colors.secondaryColor.swiftUIColor
                        .opacity(0.15)
                        .cornerRadius(cornerRadius)
                        .scaleEffect(x: 0.95)
                        .offset(y: 30)
                }
            }
            .padding(.bottom, 30)
    }
}

struct CardCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CardCanvasView {
            Text("Hello World!!!")
        }
        .background(Color.blue)
    }
}
