//
//  Query.swift
//  Estilo
//
//  Created by Allan Weir on 01/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Foundation

public enum QueryScope {
    case device
    case session
}

public protocol Query {
    var scope: QueryScope { get }
    
    func isApplicable() -> Bool
}
