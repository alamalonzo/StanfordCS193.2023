//
//  StanfordCS193_2023App.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 9/8/24.
//

import SwiftUI

@main
struct StanfordCS193_2023App: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
