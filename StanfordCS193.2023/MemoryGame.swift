//
//  MemoryGame.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 23/8/24.
//

import Foundation

//This is the "I dont care Type" is actually a: Generic Type Parameter
struct MemoryGame<CountryContent> {
    
    //Private(set): is private to edit but you can See from outside
    private(set) var countries: Array<Country>
    
    
    //You can have Multiples Init for a struct
    //The job of each one is to Init all the variables
    init(numberOfPairsOfCountries: Int, countryContentFactory: (Int) -> CountryContent) {
        countries = []
        
        for pairIndex in 0..<numberOfPairsOfCountries {
            //Funtional as types:
            // In the Init we create parameter that takes a funtions: "countryContentFactory"
            let content: CountryContent = countryContentFactory(pairIndex)
            countries.append(Country(content: content))
            countries.append(Country(content: content))
            
        }
    }
    
    func choose(country: Country) {
        
    }
    
    struct Country {
        var isFaceUp = false
        var isMatched = false
        let content: CountryContent
        
    }
    
    
    
    
}
