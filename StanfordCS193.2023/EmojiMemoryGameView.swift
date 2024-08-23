//
//  EmojiMemoryGameView.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 9/8/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        ScrollView{
            countries
        }
        .padding()
    }
    
    
    var countries: some View {
        let grid = [GridItem(.adaptive(minimum: 85), spacing: 0)]
        
        return LazyVGrid(columns: grid, spacing: 0){
            ForEach(viewModel.countries.indices, id: \.self) { index in
                CardView(viewModel.countries[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(.orange)
        
    }
}

struct CardView: View {
    let country: MemoryGame<String>.Country
    
    init(_ country: MemoryGame<String>.Country) {
        self.country = country
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 20)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(country.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(country.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(country.isFaceUp ? 0 : 1)
        }
    }
}


#Preview {
    EmojiMemoryGameView()
}

