//
//  SequenceExtension.swift
//  Estilo
//
//  Created by Allan Weir on 20/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Foundation

extension Sequence where Element: StyleProperty {

    func uniqueLatest() -> [Element] {
        var unique = [Iterator.Element]()
        for item in self.reversed() {
            if !unique.contains(item) {
                unique.append(item)
            }
        }
        return unique.reversed()
    }
    
    func itemOf(type: Element) -> Element? {
        for item in self {
            if item == type {
                return item
            }
        }
        return nil
    }

}
