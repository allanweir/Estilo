//
//  TypographyStyle.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public extension Styles {
    
    public enum Typography: String {
        case attachment
        case backgroundColor
        case baselineOffset
        case expansion
        case font
        case foregroundColor
        case kern
        case ligature
        case link
        case obliqueness
        case paragraphStyle
        case shadow
        case strikethroughColor
        case strikethroughStyle
        case strokeColor
        case strokeWidth
        case textEffect
        case underlineColor
        case underlineStyle
        case verticalGlyphForm
        case writingDirection
        
        // Convenience duplicates
        case textColor //foregroundColor
    }
}

public class TypographyStyle: BaseStyle<Styles.Typography>, StyleContainer {
    
    public required init(inherits parent: TypographyStyle? = nil, properties: StyleProperties) {
        super.init(inherits: parent, properties: properties)
    }
    
}
