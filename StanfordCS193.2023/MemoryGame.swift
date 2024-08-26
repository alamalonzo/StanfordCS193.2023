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
        get {
            
            
            var faceUpCountryIndices = [Int]()
            for index in countries.indices {
                if countries[index].isFaceUp {
                    faceUpCountryIndices.append(index)
                }
            }
            if faceUpCountryIndices.count == 1 {
                return faceUpCountryIndices.first
            }else{
                return nil
            }
        }
        set {
            for index in countries.indices{
                if index == newValue {
                    countries[index].isFaceUp = true
                }else {
                    countries[index].isFaceUp = false
                }
            }
        }
    }
    
    mutating func choose(country: Country) {
        //if let
        if let chosenIndex = countries.firstIndex(where: {$0.id == country.id}){
            if !countries[chosenIndex].isFaceUp && !countries[chosenIndex].isMatched {
                if let potencialMatchIndex = indexOfTheOneAndOnlyFaceUpCountry {
                    if countries[chosenIndex].content == countries[potencialMatchIndex].content {
                        countries[chosenIndex].isMatched = true
                        countries[potencialMatchIndex].isMatched = true
                    }
//                    indexOfTheOneAndOnlyFaceUpCountry = nil
                }else {
//                    for index in countries.indices {
//                        countries[index].isFaceUp = false
//                    }
                    indexOfTheOneAndOnlyFaceUpCountry = chosenIndex
                }
                countries[chosenIndex].isFaceUp = true
            }
            
          
        }
    }
    //para eliminar esto usamos countries.firstIndex(where... ver func CHoose
//    private func index(of country: Country) -> Int? {
//        for index in countries.indices {
//            if countries[index].id == country.id {
//                return index
//            }
//        }
//        return nil
//    }
    
    mutating func shuffle() {
        countries.shuffle()
    }
    
    struct Country: Equatable, Identifiable, CustomDebugStringConvertible {
    
//        //lhs == left hand side lhr: right hand side
//        static func == (lhs: Country, rhs: Country) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched &&
//            lhs.content == rhs.content
//        }
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
