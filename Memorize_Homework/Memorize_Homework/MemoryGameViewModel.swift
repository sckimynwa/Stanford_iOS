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
        let theme: Theme = getTheme()
        let contentArr: Array<String> = Array(theme.themeArr[0..<Int.random(in: 2...theme.themeArr.count)])
        
        return MemoryGame(numOfCardPairs: contentArr.count, theme: theme) {
            pairIndex in return contentArr[pairIndex]
        }
    }
    
    /* private func */
    private static func getTheme() -> Theme {
        switch MemoryGameTheme.allCases.randomElement() {
            case .HalloWeen:
                return HalloWeenTheme()
            case .Vehicle:
                return VehicleTheme()
            case .Food:
                return FoodTheme()
            default:
                return AnimalTheme()
        }
    }
    
    /* view uses */
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var theme: Theme {
        model.theme
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func reset() {
        model = MemoryGameViewModel.createMemoryGame()
    }
}
