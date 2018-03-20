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
    
    mutating func apply(styles: StyleType...)
    mutating func apply(style: StyleType)
}

public protocol TypographyStyleable {
    
    func apply(styles: TypographyStyle...)
    func apply(style: TypographyStyle)
}

public protocol TypographyViewStyleable: TypographyStyleable {
    
    static func apply(toView view: Self, styles: TypographyStyle...)
    static func apply(toView view: Self, style: TypographyStyle)
    
}
