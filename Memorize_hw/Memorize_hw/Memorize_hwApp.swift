//
//  Memorize_hwApp.swift
//  Memorize_hw
//
//  Created by Kim Sang Chul on 2021/01/02.
//

import SwiftUI

@main
struct Memorize_hwApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: NumberMemoryGame())
        }
    }
}
