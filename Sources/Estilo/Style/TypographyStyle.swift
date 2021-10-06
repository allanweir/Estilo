//
//  TypographyStyle.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public extension Styles {
    
    public enum Typography: StyleProperty {
        case attachment(NSTextAttachment)
        case backgroundColor(UIColor)
        case baselineOffset(CGFloat)
        case expansion(CGFloat)
        case font(UIFont)
        case foregroundColor(UIColor)
        case kern(CGFloat)
        case ligature(Int)
        case link(URL)
        case obliqueness(CGFloat)
        case paragraphStyle(NSParagraphStyle)
        case shadow(NSShadow)
        case strikethroughColor(UIColor)
        case strikethroughStyle(NSUnderlineStyle) //TODO Check
        case strokeColor(UIColor)
        case strokeWidth(CGFloat)
        case textEffect(NSAttributedString.TextEffectStyle)
        case underlineColor(UIColor)
        case underlineStyle(NSUnderlineStyle)
        case verticalGlyphForm(Int)
        case writingDirection(NSNumber)// TODO Check
        
        public static func ==(lhs: Styles.Typography, rhs: Styles.Typography) -> Bool {
            switch (lhs, rhs) {
            case (.attachment, .attachment): fallthrough
            case (.backgroundColor, .backgroundColor): fallthrough
            case (.baselineOffset, .baselineOffset): fallthrough
            case (.expansion, .expansion): fallthrough
            case (.font, .font): fallthrough
            case (.foregroundColor, .foregroundColor): fallthrough
            case (.kern, .kern): fallthrough
            case (.ligature, .ligature): fallthrough
            case (.link, .link): fallthrough
            case (.obliqueness, .obliqueness): fallthrough
            case (.paragraphStyle, .paragraphStyle): fallthrough
            case (.shadow, .shadow): fallthrough
            case (.strikethroughColor, .strikethroughColor): fallthrough
            case (.strikethroughStyle, .strikethroughStyle): fallthrough
            case (.strokeColor, .strokeColor): fallthrough
            case (.strokeWidth, .strokeWidth): fallthrough
            case (.textEffect, .textEffect): fallthrough
            case (.underlineColor, .underlineColor): fallthrough
            case (.underlineStyle, .underlineStyle): fallthrough
            case (.verticalGlyphForm, .verticalGlyphForm): fallthrough
            case (.writingDirection, .writingDirection):
                return true
            default:
                return false
            }
        }
        
    }
}

public class TypographyStyle: BaseStyle<Styles.Typography>, StyleContainer {
    
    public required init(inherits parent: TypographyStyle? = nil, properties: StyleProperties) {
        super.init(inherits: parent, properties: properties)
    }
    
}
