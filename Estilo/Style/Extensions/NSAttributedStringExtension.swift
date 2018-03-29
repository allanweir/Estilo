//
//  NSAttributedStringExtension.swift
//  Estilo
//
//  Created by Allan Weir on 01/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Foundation

public class EsAttributedString: NSAttributedString {
    
    
}

extension NSAttributedString {
    
    public convenience init(string: String, style: TypographyStyle) {
        self.init(string: string, attributes: NSAttributedString.createAttributes(from: style))
    }
    
    public convenience init(str: String, styles: TypographyStyle...) {
        var attributes: [NSAttributedStringKey: Any] = [:]
        styles.forEach { (style) in
            NSAttributedString.update(attributes: &attributes, from: style)
        }
        self.init(string: str, attributes: attributes)
    }
    
    static func createAttributes(from typography: TypographyStyle) -> [NSAttributedStringKey: Any] {
        var attributes: [NSAttributedStringKey: Any] = [:]
        self.update(attributes: &attributes, from: typography)
        return attributes
    }
    
    static func update(attributes: inout [NSAttributedStringKey: Any], from typography: TypographyStyle) {
        for property in typography.allProperties {
            switch property {
            case .attachment(let value):
                attributes[.attachment] = value
            case .backgroundColor(let value):
                attributes[.backgroundColor] = value
            case .baselineOffset(let value):
                attributes[.baselineOffset] = value
            case .expansion(let value):
                attributes[.expansion] = value
            case .font(let value):
                attributes[.font] = value
            case .foregroundColor(let value):
                attributes[.foregroundColor] = value
            case .kern(let value):
                attributes[.kern] = value
            case .ligature(let value):
                attributes[.ligature] = value
            case .link(let value):
                attributes[.link] = value
            case .obliqueness(let value):
                attributes[.obliqueness] = value
            case .paragraphStyle(let value):
                attributes[.paragraphStyle] = value
            case .shadow(let value):
                attributes[.shadow] = value
            case .strikethroughColor(let value):
                attributes[.strikethroughColor] = value
            case .strikethroughStyle(let value):
                attributes[.strikethroughStyle] = value
            case .strokeColor(let value):
                attributes[.strokeColor] = value
            case .strokeWidth(let value):
                attributes[.strokeWidth] = value
            case .textEffect(let value):
                attributes[.textEffect] = value
            case .underlineColor(let value):
                attributes[.underlineColor] = value
            case .underlineStyle(let value):
                attributes[.underlineStyle] = value
            case .verticalGlyphForm(let value):
                attributes[.verticalGlyphForm] = value
            case .writingDirection(let value):
                attributes[.writingDirection] = value
            
            }
        }
    }
    
}
