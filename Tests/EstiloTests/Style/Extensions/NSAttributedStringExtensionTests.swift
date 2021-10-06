//
//  NSAttributedStringExtensionTests.swift
//  EstiloTests
//
//  Created by Allan Weir on 15/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Quick
import Nimble
@testable import Estilo

class NSAttributedStringExtensionTests: QuickSpec {
    
    override func spec() {
        describe("NSAttributedString") {
            
            let style = TypographyStyle(inherits: nil, properties: [
                .foregroundColor(.green)
            ])
            
//            let string = NSAttributedString(string: "test", style: style)
//            context("applies Typography style", closure: {
//                NSAttributedStringExtensionTests.testStyle(string: string, style: style)
//            })
            
        }
    }
    
    static func testStyle(string: NSAttributedString, style: TypographyStyle) {
        for property in style.allProperties {
            self.testProperty(string: string, property: property)
        }
    }
    
    static func testProperty(string: NSAttributedString, property: TypographyStyle.T) {
        it("\(property)", closure: {
            switch property {
            case .attachment(let value):
                expect(string.attribute(.attachment, at: 0, effectiveRange: nil) as? NSTextAttachment).to(equal(value))
            case .backgroundColor(let value):
                expect(string.attribute(.backgroundColor, at: 0, effectiveRange: nil) as? UIColor).to(equal(value))
            case .baselineOffset(let value):
                expect(string.attribute(.baselineOffset, at: 0, effectiveRange: nil) as? CGFloat).to(equal(value))
            case .expansion(let value):
                expect(string.attribute(.expansion, at: 0, effectiveRange: nil) as? CGFloat).to(equal(value))
            case .font(let value):
                expect(string.attribute(.font, at: 0, effectiveRange: nil) as? UIFont).to(equal(value))
            case .foregroundColor(let value):
                expect(string.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor).to(equal(value))
            case .kern(let value):
                expect(string.attribute(.kern, at: 0, effectiveRange: nil) as? CGFloat).to(equal(value))
            case .ligature(let value):
                expect(string.attribute(.ligature, at: 0, effectiveRange: nil) as? Int).to(equal(value))
            case .link(let value):
                expect(string.attribute(.link, at: 0, effectiveRange: nil) as? URL).to(equal(value))
            case .obliqueness(let value):
                expect(string.attribute(.obliqueness, at: 0, effectiveRange: nil) as? CGFloat).to(equal(value))
            case .paragraphStyle(let value):
                expect(string.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSParagraphStyle).to(equal(value))
            case .shadow(let value):
                expect(string.attribute(.shadow, at: 0, effectiveRange: nil) as? NSShadow).to(equal(value))
            case .strikethroughColor(let value):
                expect(string.attribute(.strikethroughColor, at: 0, effectiveRange: nil) as? UIColor).to(equal(value))
            case .strikethroughStyle(let value):
                expect(string.attribute(.strikethroughStyle, at: 0, effectiveRange: nil) as? NSUnderlineStyle).to(equal(value))
            case .strokeColor(let value):
                expect(string.attribute(.strokeColor, at: 0, effectiveRange: nil) as? UIColor).to(equal(value))
            case .strokeWidth(let value):
                expect(string.attribute(.strokeWidth, at: 0, effectiveRange: nil) as? CGFloat).to(equal(value))
            case .textEffect(let value):
                expect(string.attribute(.textEffect, at: 0, effectiveRange: nil) as? NSAttributedString.TextEffectStyle).to(equal(value))
            case .underlineColor(let value):
                expect(string.attribute(.underlineColor, at: 0, effectiveRange: nil) as? UIColor).to(equal(value))
            case .underlineStyle(let value):
                expect(string.attribute(.underlineStyle, at: 0, effectiveRange: nil) as? NSUnderlineStyle).to(equal(value))
            case .verticalGlyphForm(let value):
                expect(string.attribute(.verticalGlyphForm, at: 0, effectiveRange: nil) as? Int).to(equal(value))
            case .writingDirection(let value):
                expect(string.attribute(.writingDirection, at: 0, effectiveRange: nil) as? NSNumber).to(equal(value))
            }
        })
    }
    
}
