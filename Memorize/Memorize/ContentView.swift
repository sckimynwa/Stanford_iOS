//
//  ContentView.swift
//  Memorize
//
//  Created by Kim Sang Chul on 2021/01/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            ForEach(0..<4, content: {
                index in
                CardView(isFaceUp: true)
            })
        })
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
