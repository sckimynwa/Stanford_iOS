//
//  MemoryGameModel.swift
//  Memorize_Homework
//
//  Created by Kim Sang Chul on 2021/01/03.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var theme: Theme
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{ cards.indices.filter{ cards[$0].isFaceUp }.only }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // if faceUp card already exists
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numOfCardPairs: Int, theme createdTheme: Theme ,createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        theme = createdTheme
        for pairIndex in 0..<numOfCardPairs {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content, isFaceUp: false, isMatched: false))
            cards.append(Card(id: pairIndex * 2 + 1, content: content, isFaceUp: false, isMatched: false))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool
        var isMatched: Bool
    }
}
