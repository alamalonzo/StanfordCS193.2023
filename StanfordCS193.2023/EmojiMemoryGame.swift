//
//  EmojiMemoryGame.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 23/8/24.
//

import SwiftUI

//ObservableObject: reactive UI
class EmojiMemoryGame: ObservableObject{
    private static let countries = ["🇺🇸","🇩🇴","🇨🇴","🇪🇸","🇦🇷","🇨🇦","🇨🇺","🇪🇨","🇧🇷","🇸🇻","🇺🇾","🇵🇪","🇯🇵","🇲🇽","🇵🇦",]
    
    private static func  createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCountries: 6) { pairIndex in
            if countries.indices.contains(pairIndex){
                return countries[pairIndex]
            }else {
                return "🤷🏽‍♂️"
            }
        }
    }
    
    //If something change it comunicate thats why yhe ObservableObject is. and the Published
    @Published private var model = createMemoryGame()
    
    
    var countries: Array<MemoryGame<String>.Country> {
        model.countries
    }
    
    //MARK: - Intets
    
    func shuffle() {
        model.shuffle()
        
    }
    
    func choose(_ country: MemoryGame<String>.Country) {
        model.choose(country: country)
    }
    
}
