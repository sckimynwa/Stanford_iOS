//
//  NumberMemoryGame.swift
//  Memorize_hw
//
//  Created by Kim Sang Chul on 2021/01/02.
//

import SwiftUI

class NumberMemoryGame {
    private var model: MemoryGame<Int> = NumberMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<Int> {
        let numOfPairs = Int.random(in: 2...5)
        let numbers = Array<Int>(0...numOfPairs)
        print(numbers)
        return MemoryGame<Int>(numOfCards: numbers.count){
            number in return number
        }
    }
    
    var cards: Array<MemoryGame<Int>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<Int>.Card) {
        model.choose(card: card)
    }
}
