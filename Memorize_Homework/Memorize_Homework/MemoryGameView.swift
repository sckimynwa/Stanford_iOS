//
//  MemoryGameView.swift
//  Memorize_Homework
//
//  Created by Kim Sang Chul on 2021/01/03.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        VStack(alignment: .leading, content: {
            TitleView(theme: viewModel.theme)
            ScoreView(score: viewModel.score)
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(viewModel.theme.color)
            FooterView(resetGame: viewModel.reset)
        })
    }
}

struct TitleView: View {
    var theme: Theme
    var body: some View {
        Text("\(theme.name) Theme")
            .font(.headline)
            .padding(.leading, 30)
            .padding(.top, 30)
    }
}

struct ScoreView: View {
    var score: Int
    var body: some View {
        HStack {
            Spacer()
            Text("\(score) Point")
                .font(.subheadline)
                .padding(.trailing, 30)
                .padding(.top, 10)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(content: {
                if card.isFaceUp {
                    Text(card.content)
                }
            })
            .font(Font.system(size: fontSize(for: geometry.size)))
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // Constants
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct FooterView: View {
    var resetGame: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                print("Button Clicked!")
                resetGame()
            }){ Text("New Game")}
                .padding(.trailing, 30)
                .padding(.bottom, 30)
        }
    }
}
