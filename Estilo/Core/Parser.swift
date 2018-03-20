//
//  Parser.swift
//  Estilo
//
//  Created by Allan Weir on 14/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

class Parser {

    static func recordError(type: Any.Type, value: Any) {
        print("Could not create \(type) from object \"\(value)\"")
    }
    
    static func parse<T: Any>(_ value: Any) -> T? {
        if let value = value as? T {
            return value
        }
        self.recordError(type: T.self, value: value)
        return nil
    }

}
