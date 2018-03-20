//
//  NSAttributedStringExtension.swift
//  Estilo
//
//  Created by Allan Weir on 01/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    public convenience init(string: String, style: TypographyStyle) {
        self.init(string: string, attributes: NSAttributedString.createAttributes(from: style))
    }
    
    public convenience init(string: String, styles: TypographyStyle...) {
        var attributes: [NSAttributedStringKey: Any] = [:]
        styles.forEach { (style) in
            NSAttributedString.update(attributes: &attributes, from: style)
        }
        self.init(string: string, attributes: attributes)
    }
    
    static func createAttributes(from typography: TypographyStyle) -> [NSAttributedStringKey: Any] {
        var attributes: [NSAttributedStringKey: Any] = [:]
        self.update(attributes: &attributes, from: typography)
        return attributes
    }
    
    static func update(attributes: inout [NSAttributedStringKey: Any], from typography: TypographyStyle) {
        for (property, value) in typography.allProperties {
            switch property {
            case .attachment:
                _ = self.update(&attributes, key: .attachment, with: value, as: NSTextAttachment.self)
            case .backgroundColor:
                _ = self.update(&attributes, key: .backgroundColor, with: value, as: UIColor.self)
            case .baselineOffset:
                _ = self.update(&attributes, key: .baselineOffset, with: value, as: [NSNumber.self, CGFloat.self, Float.self])
            case .expansion:
                _ = self.update(&attributes, key: .expansion, with: value, as: [NSNumber.self, CGFloat.self, Float.self])
            case .font:
                _ = self.update(&attributes, key: .font, with: value, as: UIFont.self)
            case .foregroundColor, .textColor:
                _ = self.update(&attributes, key: .foregroundColor, with: value, as: UIColor.self)
            case .kern:
                _ = self.update(&attributes, key: .kern, with: value, as: [NSNumber.self, CGFloat.self, Float.self])
            case .ligature:
                _ = self.update(&attributes, key: .ligature, with: value, as: [NSNumber.self, Int.self])
            case .link:
                _ = self.update(&attributes, key: .link, with: value, as: NSURL.self)
            case .obliqueness:
                _ = self.update(&attributes, key: .obliqueness, with: value, as: [NSNumber.self, CGFloat.self, Float.self])
            case .paragraphStyle:
                _ = self.update(&attributes, key: .paragraphStyle, with: value, as: NSParagraphStyle.self)
            case .shadow:
                _ = self.update(&attributes, key: .shadow, with: value, as: NSShadow.self)
            case .strikethroughColor:
                _ = self.update(&attributes, key: .strikethroughColor, with: value, as: UIColor.self)
            case .strikethroughStyle:
                _ = self.update(&attributes, key: .strikethroughStyle, with: value, as: [NSNumber.self, NSUnderlineStyle.self, Int.self])
            case .strokeColor:
                _ = self.update(&attributes, key: .strokeColor, with: value, as: UIColor.self)
            case .strokeWidth:
                _ = self.update(&attributes, key: .strokeWidth, with: value, as: [NSNumber.self, CGFloat.self, Float.self])
            case .textEffect:
                _ = self.update(&attributes, key: .textEffect, with: value, as: [NSAttributedString.TextEffectStyle.self, NSString.self])
            case .underlineColor:
                _ = self.update(&attributes, key: .underlineColor, with: value, as: UIColor.self)
            case .underlineStyle:
                _ = self.update(&attributes, key: .underlineStyle, with: value, as: [NSNumber.self, NSUnderlineStyle.self, Int.self])
            case .verticalGlyphForm:
                _ = self.update(&attributes, key: .verticalGlyphForm, with: value, as: [NSNumber.self, Int.self])
            case .writingDirection:
                _ = self.update(&attributes, key: .writingDirection, with: value, as: [NSNumber].self)
            
            }
        }
    }
    
    private static func update<T>(_ attributes: inout [NSAttributedStringKey: Any], key: NSAttributedStringKey, with value: Any, as type: T) -> Bool {
        if let value: T = Parser.parse(value) {
            attributes[key] = value
            return true
        }
        return false
    }
    
    private static func update<T>(_ attributes: inout [NSAttributedStringKey: Any], key: NSAttributedStringKey, with value: Any, as types: [T]) -> Bool {
        for type in types {
            if self.update(&attributes, key: key, with: value, as: type) {
                return true
            }
        }
        return false
    }
    
}
