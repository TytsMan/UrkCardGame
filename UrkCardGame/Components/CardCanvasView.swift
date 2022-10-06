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
    
    var body: some View {
        VStack(content: content)
            .padding(30)
            .background(Assets.Colors.secondaryColor.swiftUIColor)
            .cornerRadius(30)
            .background {
                ZStack {
                    Assets.Colors.secondaryColor.swiftUIColor
                        .opacity(0.3)
                        .cornerRadius(30)
                        .scaleEffect(x: 0.98)
                        .offset(y: 15)
                    Assets.Colors.secondaryColor.swiftUIColor
                        .opacity(0.15)
                        .cornerRadius(30)
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
