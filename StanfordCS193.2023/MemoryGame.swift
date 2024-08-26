//
//  MemoryGame.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 23/8/24.
//

import Foundation

//This is the "I dont care Type" is actually a: Generic Type Parameter
struct MemoryGame<CountryContent> where CountryContent: Equatable {
    
    //Private(set): is private to edit but you can See from outside
    private(set) var countries: Array<Country>
    
    
    //You can have Multiples Init for a struct
    //The job of each one is to Init all the variables
    init(numberOfPairsOfCountries: Int, countryContentFactory: (Int) -> CountryContent) {
        countries = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCountries) {
            //Funtional as types:
            // In the Init we create parameter that takes a funtions: "countryContentFactory"
            let content: CountryContent = countryContentFactory(pairIndex)
            countries.append(Country(content: content, id: "\(pairIndex+1)a"))
            countries.append(Country(content: content, id: "\(pairIndex+1)b"))
            
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCountry: Int? {
        //compute properties
        get { countries.indices.filter { index in countries[index].isFaceUp }.only
//            return faceUpCountryIndices.count == 1 ? faceUpCountryIndices.first : nil
        }
        set {countries.indices.forEach { countries[$0].isFaceUp = (newValue == $0)}
        }
    }
    
    mutating func choose(country: Country) {
        //if let lo puedes usar en diferentes lugaraes si x y y son iguales.
        if let chosenIndex = countries.firstIndex(where: {$0.id == country.id}){
            if !countries[chosenIndex].isFaceUp && !countries[chosenIndex].isMatched {
                if let potencialMatchIndex = indexOfTheOneAndOnlyFaceUpCountry {
                    if countries[chosenIndex].content == countries[potencialMatchIndex].content {
                        countries[chosenIndex].isMatched = true
                        countries[potencialMatchIndex].isMatched = true
                    }
                }else {
                    indexOfTheOneAndOnlyFaceUpCountry = chosenIndex
                }
                countries[chosenIndex].isFaceUp = true
            }
            
          
        }
    }
    mutating func shuffle() {
        countries.shuffle()
    }
    
    struct Country: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CountryContent
        
        var id: String
        
        //Protocolo:CustomDebugStringConvertible: para cuando se imprima Country imprimir los valores como quieras en el orden que digas: 
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}

extension Array {
    //Element is a Dont care for arrays
    var only: Element? {
        count == 1 ? first : nil
    }
}
