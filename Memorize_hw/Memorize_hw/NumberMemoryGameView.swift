//
//  ContentView.swift
//  Memorize_hw
//
//  Created by Kim Sang Chul on 2021/01/02.
//

import SwiftUI

struct NumberMemoryGameView: View {
    @ObservedObject var viewModel: NumberMemoryGame
    
    var body: some View {
        HStack(content: {
            ForEach(viewModel.cards, content: {
                card in CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            })
        })
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<Int>.Card
    
    var body: some View {
        GeometryReader {
            geometry in
            ZStack(content: {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                    Text(String(card.content))
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            })
            .font(Font.system(size: calcSize(for: geometry.size)))
        }
    }
    
    // MARK: - Declare Constants
    let cornerRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
    
    func calcSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NumberMemoryGameView(viewModel: NumberMemoryGame())
    }
}
