//
//  Cardify.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 2/9/24.
//

import SwiftUI


struct Cardify: ViewModifier {
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                    .overlay(content)
                    .opacity(isFaceUp ? 1 : 0)
                base.fill()
                    .opacity(isFaceUp ? 0 : 1)
        }
        
    }
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
    }
    
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
