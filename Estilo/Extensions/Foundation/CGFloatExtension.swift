//
//  CGFloatExtension.swift
//  Estilo
//
//  Created by Allan Weir on 02/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

extension CGFloat {

    //A typealias for a math operator in Swift, pass +, -, *, / etc. as an argument
    public typealias OperatorFunction = ((CGFloat, CGFloat) -> CGFloat)
    
    //A typealias for a math comparator in Swift, pass <, <=, ==, >=, > as an argument
    public typealias ComparatorFunction = ((CGFloat, CGFloat) -> Bool)
    
    //Convenience for passing a comparator as a default argument in a method signature
    public struct Comparator {
        static let lessThan: ComparatorFunction = (<)
        static let lessThanOrEqualTo: ComparatorFunction = (<=)
        static let greaterThan: ComparatorFunction = (>)
        static let greaterThanOrEqualTo: ComparatorFunction = (>=)
        static let equalTo: ComparatorFunction = (==)
    }
    
}
