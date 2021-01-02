//
//  ContentView.swift
//  Memorize_hw
//
//  Created by Kim Sang Chul on 2021/01/02.
//

import SwiftUI

struct ContentView: View {
    var columns: [GridItem] = [
        GridItem(.fixed(70)),
        GridItem(.fixed(70)),
        GridItem(.fixed(70)),
        GridItem(.fixed(70))
    ]
    
    var viewModel: NumberMemoryGame
    
    var body: some View {
        HStack(content: {
            LazyVGrid(
                columns: columns,
                alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/,
                content: {
                    ForEach(viewModel.cards, content: {
                        card in CardView(card: card).onTapGesture {
                            viewModel.choose(card: card)
                        }
                    })

            })
        })
        .foregroundColor(Color.orange)
        .font(viewModel.cards.count >= 5 ? Font.largeTitle : Font.title)
    }
}

struct CardView: View {
    var card: MemoryGame<Int>.Card
    
    var body: some View {
        ZStack(content: {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        })
        .frame(width: 60, height: 90)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: NumberMemoryGame())
    }
}
