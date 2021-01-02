//
//  NumberMemoryGame.swift
//  Memorize_hw
//
//  Created by Kim Sang Chul on 2021/01/02.
//

import SwiftUI

/*
    View Model
*/
class NumberMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<Int> = NumberMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<Int> {
        let numOfPairs = Int.random(in: 0...2)
        let numbers = Array<Int>(0...numOfPairs)
        return MemoryGame<Int>(numOfCards: numbers.count){
            number in return number
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<Int>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<Int>.Card) {
        model.choose(card: card)
    }
}
