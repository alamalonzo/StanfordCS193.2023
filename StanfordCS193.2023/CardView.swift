//
//  CountryView.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 2/9/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Country
    
    let country: Card
    
    init(_ country: Card) {
        self.country = country
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(0.4)
            .overlay(
        Text(country.content)
            .font(.system(size: Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .multilineTextAlignment(.center)
            .aspectRatio(1, contentMode: .fit)
            .padding(5)
        )
            .padding(Constants.inset)
        //ver archivo Cardify. Necesario para la animacion.
            .modifier(Cardify(isFaceUp: country.isFaceUp))
            .opacity(country.isFaceUp || !country.isMatched ? 1 : 0)
    }
}

// private so we only can used in here
// static so we can acces directly, sin tener que inicializarlo en una vatiable.
private struct Constants {
    static let cornerRadius: CGFloat = 12
    static let lineWidth: CGFloat = 2
    static let inset: CGFloat = 5
    struct FontSize {
        static let largest: CGFloat = 200
        static let smallest: CGFloat = 10
        static let scaleFactor = smallest / largest
    }
}



#Preview {
    VStack{
        HStack {
            CardView(MemoryGame<String>.Country(isFaceUp: true, content: "🐹", id: "test"))
            CardView(MemoryGame<String>.Country(content: "🐹", id: "test"))
        }
        HStack {
            CardView(MemoryGame<String>.Country(content: "🦁", id: "test"))
            CardView(MemoryGame<String>.Country(isFaceUp: true, content: "🦁", id: "test"))
        }
    }
        .padding()
        .foregroundStyle(.green)
    
}
