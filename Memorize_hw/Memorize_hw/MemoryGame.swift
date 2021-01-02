//
//  MemoryGame.swift
//  Memorize_hw
//
//  Created by Kim Sang Chul on 2021/01/02.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("selected card: \(card)")
    }
    
    init(numOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numOfCards {
            // MARK: - Create Pairs of Cards
            let content = cardContentFactory(pairIndex);
            cards.append(Card(id: pairIndex*2, isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(id: pairIndex*2+1, isFaceUp: false, isMatched: false, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
