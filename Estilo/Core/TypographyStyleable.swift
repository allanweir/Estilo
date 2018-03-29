//
//  TypographyStyleable.swift
//  Estilo
//
//  Created by Allan Weir on 20/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

public protocol TypographyStyleable {
    
    func apply(styles: TypographyStyle...)
    func apply(style: TypographyStyle)
}

public protocol TypographyViewStyleable: TypographyStyleable {
    
    static func apply(toView view: Self, styles: TypographyStyle...)
    static func apply(toView view: Self, style: TypographyStyle)
}
