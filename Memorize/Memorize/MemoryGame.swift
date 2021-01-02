//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kim Sang Chul on 2021/01/02.
//

import Foundation

// Card Content is Generic Type
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            // MARK: - Create Both Pairs of Cards
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex * 2))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
    }
}
