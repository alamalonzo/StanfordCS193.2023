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
    
    
    
    //Here you are calling for the Model as a Type and
    //look how you specific the "String"typy in the Generic parameter
    //1
    //private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCountries: 4, countryContentFactory: createCountryContent)
    //2
    private var model: MemoryGame<String> = MemoryGame(numberOfPairsOfCountries: 4) { pairIndex in
        return countries[pairIndex]
        }
    
    var countries: Array<MemoryGame<String>.Country> {
        model.countries
    }
    
    func choose(_ country: MemoryGame<String>.Country) {
        model.choose(country: country)
    }
}
