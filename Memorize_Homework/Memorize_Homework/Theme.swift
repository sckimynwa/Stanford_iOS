//
//  Theme.swift
//  Memorize_Homework
//
//  Created by Kim Sang Chul on 2021/01/03.
//

import SwiftUI

/* Theme Protocol & Struct */
protocol Theme {
    var name: String { get set }
    var color: Color { get set }
    var themeArr: Array<String> { get set }
}

struct HalloWeenTheme: Theme {
    var name: String = "HalloWeen"
    var color: Color = Color.orange
    var themeArr: Array<String> = ["🕸", "🎃", "👻", "💀", "🕯"]
}

struct VehicleTheme: Theme {
    var name: String = "Vehicle"
    var color: Color = Color.blue
    var themeArr: Array<String> = ["🚗", "🛻", "🚄", "🚀", "🛸"]
}

struct FoodTheme: Theme {
    var name: String = "Food"
    var color: Color = Color.green
    var themeArr: Array<String> = ["🍔", "🥨", "🍕", "🍪", "🍩"]
}

struct AnimalTheme: Theme {
    var name: String = "Animal"
    var color: Color = Color.yellow
    var themeArr: Array<String> = ["🐶", "🐵", "🐥", "🐼", "🦄"]
}


/* Enum Type of Theme */
enum MemoryGameTheme: CaseIterable {
    case HalloWeen
    case Vehicle
    case Food
    case Animal
}
