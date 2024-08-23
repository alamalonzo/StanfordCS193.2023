//
//  EmojiMemoryGame.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 23/8/24.
//

import SwiftUI

//
//func createCountryContent(forPairAtIndex index: Int) -> String {
//    return ["🇺🇸","🇩🇴","🇨🇴","🇪🇸","🇦🇷","🇨🇦","🇨🇺","🇪🇨","🇧🇷","🇸🇻","🇺🇾","🇵🇪","🇯🇵","🇲🇽","🇵🇦",][index]
//}

//This is the ViewModel
class EmojiMemoryGame{
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
    
    private var model = createMemoryGame()
    
    
    var countries: Array<MemoryGame<String>.Country> {
        model.countries
    }
    
    func choose(_ country: MemoryGame<String>.Country) {
        model.choose(country: country)
    }
    
}
