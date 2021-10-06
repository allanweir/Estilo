//
//  Styleable.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

public protocol Styleable {
    associatedtype StyleType: StyleContainer
    
    static func apply(toView view: Self, styles: StyleType...)
    static func apply(toView view: Self, style: StyleType)
    static func apply(toView view: Self, property: StyleType.T)
    
    mutating func apply(styles: StyleType...)
    mutating func apply(style: StyleType)
}
