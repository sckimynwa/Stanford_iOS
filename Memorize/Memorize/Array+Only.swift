//
//  Array+Only.swift
//  Memorize
//
//  Created by Kim Sang Chul on 2021/01/03.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
