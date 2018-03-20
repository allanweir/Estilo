//
//  DictionaryExtension.swift
//  Estilo
//
//  Created by Allan Weir on 12/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

extension Dictionary {

    mutating func update(withContentsOf dictionary: Dictionary) {
        dictionary.forEach { (key, value) in
            self[key] = value
        }
    }
    
    func updating(withContentsOf dictionary: Dictionary) -> Dictionary {
        var newDictionary = self
        dictionary.forEach { (key, value) in
            newDictionary[key] = value
        }
        return newDictionary
    }

}
