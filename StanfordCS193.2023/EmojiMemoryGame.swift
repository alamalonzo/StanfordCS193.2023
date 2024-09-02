//
//  EmojiMemoryGame.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 23/8/24.
//

import SwiftUI

//ObservableObject: reactive UI
class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Country
    private static let countries = ["🇺🇸","🇩🇴","🇨🇴","🇪🇸","🇦🇷","🇨🇦","🇨🇺","🇪🇨","🇧🇷","🇸🇻","🇺🇾","🇵🇪","🇯🇵","🇲🇽","🇵🇦",]
    
    private static func  createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCountries: 3) { pairIndex in
            if countries.indices.contains(pairIndex){
                return countries[pairIndex]
            }else {
                return "🤷🏽‍♂️"
            }
        }
    }
    
    //If something change it comunicate thats why yhe ObservableObject is. and the Published
    @Published private var model = createMemoryGame()
    
    
    var countries: Array<Card> {
        model.countries
    }
    
    //para que se encargue del color
    var color: Color {
        .orange
    }
    
    //MARK: - Intets
    
    func shuffle() {
        model.shuffle()
        
    }
    
    func choose(_ country: Card) {
        model.choose(country: country)
    }
    
}
