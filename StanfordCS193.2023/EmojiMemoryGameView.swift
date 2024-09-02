//
//  EmojiMemoryGameView.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 9/8/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //by the ViewModel
    @ObservedObject var viewModel: EmojiMemoryGame
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 5
    
    var body: some View {
        VStack{
            ScrollView{
                countries
                    .foregroundStyle(viewModel.color)
                    .animation(.default, value: viewModel.countries)
            }
            .padding()
        }
        Button("Shuffle") {
            viewModel.shuffle()
        }
    }
    var countries: some View {
        AspectVGrid(viewModel.countries, aspectRatio: aspectRatio) { country in
            CardView(country).padding(spacing)
                .onTapGesture {
                    viewModel.choose(country)
          }
        }
        
    }
    

}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

