//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Kim Sang Chul on 2021/01/03.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
