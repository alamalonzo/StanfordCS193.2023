//
//  ContentView.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 9/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.orange)
        .padding()
        
    }
}

#Preview {
    ContentView()
}


struct CardView: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("Hey").font(.largeTitle)
            }else{
                base.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
        
    }
    
}
