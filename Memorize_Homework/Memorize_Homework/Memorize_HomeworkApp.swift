//
//  Memorize_HomeworkApp.swift
//  Memorize_Homework
//
//  Created by Kim Sang Chul on 2021/01/03.
//

import SwiftUI

@main
struct Memorize_HomeworkApp: App {
    var body: some Scene {
        WindowGroup {
            let game = MemoryGameViewModel()
            MemoryGameView(viewModel: game)
        }
    }
}
