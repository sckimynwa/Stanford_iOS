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
                    withAnimation(.linear(duration:2)) {
                        viewModel.choose(card: card)
                    }
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
        if card.isFaceUp || !card.isMatched {
            GeometryReader { geometry in
                ZStack(content: {
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1.5).repeatForever(autoreverses: false): .default)
                })
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
            }
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
                withAnimation(.easeInOut(duration:1.5)) {
                    resetGame()
                }
            }){ Text("New Game")}
                .padding(.trailing, 30)
                .padding(.bottom, 30)
        }
    }
}
