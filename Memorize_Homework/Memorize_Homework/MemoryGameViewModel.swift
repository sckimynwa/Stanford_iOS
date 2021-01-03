//
//  MemoryGameViewModel.swift
//  Memorize_Homework
//
//  Created by Kim Sang Chul on 2021/01/03.
//

import Foundation

class MemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGame<String> = MemoryGameViewModel.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let contentArr: Array<String> = ["👻", "🎃", "🕸"]
        return MemoryGame(numOfCardPairs: contentArr.count){
            pairIndex in return contentArr[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
