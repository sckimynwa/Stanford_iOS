//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Kim Sang Chul on 2021/01/01.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card:card).onTapGesture {
                viewModel.choose(card:card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(content: {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockwise: true).padding(5).opacity(0.4)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
                
            })
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.7
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
