//
//  ContentView.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 9/8/24.
//

import SwiftUI

struct ContentView: View {
//    var viewModel: EmojiMemoryGame
    
    let countries = ["🇺🇸","🇩🇴","🇨🇴","🇪🇸","🇦🇷","🇨🇦","🇨🇺","🇪🇨","🇧🇷","🇸🇻","🇺🇾","🇵🇪","🇯🇵","🇲🇽","🇵🇦",]
    
    var body: some View {
        
        var grid = [GridItem(.adaptive(minimum: 85))]
        
        LazyVGrid(columns: grid){
            ForEach(countries.indices, id: \.self) { index in
                CardView(content: countries[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
//        .padding()
        
    }
}

#Preview {
    ContentView()
}


struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else{
                base.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
        
    }
    
}
