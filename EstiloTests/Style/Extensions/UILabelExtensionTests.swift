//
//  UILabelExtensionTests.swift
//  EstiloTests
//
//  Created by Allan Weir on 05/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Quick
import Nimble
@testable import Estilo

class UILabelExtensionTests: QuickSpec {
    
    override func spec() {
        describe("UILabel") {
            
            let label = UILabel()
            
//            let typography = TypographyStyle(inherits: nil, properties: [
//                .foregroundColor(.green),
//                .backgroundColor(.red),
//                .font(UIFont.systemFont(ofSize: 22))
//            ])
            
            let labelStyle = LabelStyle(inherits: nil, properties: [
//                .typography(typography),
                .allowsDefaultTighteningForTruncation(true),
                .adjustsFontSizeToFitWidth(true),
                .baselineAdjustment(.alignCenters),
                .font(UIFont.boldSystemFont(ofSize: 16)),
                .highlightedTextColor(.red),
                .isHighlighted(true),
                .lineBreakMode(.byClipping),
                .minimumScaleFactor(0.2),
                .numberOfLines(5),
                .preferredMaxLayoutWidth(6.0),
                .shadowColor(.green),
                .shadowOffset(CGSize(width: 4, height: 4)),
                .textAlignment(.right),
                .textColor(.yellow)
            ])
            
            label.apply(style: labelStyle)
            context("applies Label style", closure: {
                UILabelExtensionTests.testStyle(label: label, style: labelStyle)
            })
            
        }
    }
    
    static func testStyle(label view: UILabel, style: LabelStyle) {
        for property in style.allProperties {
            self.testProperty(label: view, properties: style, property: property)
        }
    }
    
    static func testProperty(label view: UILabel, properties: LabelStyle, property: LabelStyle.T) {
        it("\(property)", closure: {
            switch property {
            case .view(let value):
                UIViewExtensionTests.testStyle(view: view, style: value)
            case .viewProperty(let value):
                UIViewExtensionTests.testProperty(view: view, property: value)
            case .typography(let value):
                UILabelExtensionTests.testTypographyStyle(label: view, style: value)
            case .allowsDefaultTighteningForTruncation(let value):
                expect(view.allowsDefaultTighteningForTruncation).to(equal(value))
            case .adjustsFontSizeToFitWidth(let value):
                expect(view.adjustsFontSizeToFitWidth).to(equal(value))
            case .baselineAdjustment(let value):
                expect(view.baselineAdjustment).to(equal(value))
            case .font(let value):
                if let typography = properties.allProperties.itemOf(type: .typography(TypographyStyle(properties: []))) {
                    
                }
                expect(view.font).to(equal(value))
            case .highlightedTextColor(let value):
                expect(view.highlightedTextColor).to(equal(value))
            case .isHighlighted(let value):
                expect(view.isHighlighted).to(equal(value))
            case .lineBreakMode(let value):
                expect(view.lineBreakMode).to(equal(value))
            case .minimumScaleFactor(let value):
                let delta: CGFloat = 0.00001
                expect(abs(view.minimumScaleFactor-value) < delta).to(equal(true))
            case .numberOfLines(let value):
                expect(view.numberOfLines).to(equal(value))
            case .preferredMaxLayoutWidth(let value):
                expect(view.preferredMaxLayoutWidth).to(equal(value))
            case .shadowColor(let value):
                expect(view.shadowColor).to(equal(value))
            case .shadowOffset(let value):
                expect(view.shadowOffset).to(equal(value))
            case .textAlignment(let value):
                expect(view.textAlignment).to(equal(value))
            case .textColor(let value):
                expect(view.textColor).to(equal(value))
            }
        })
    }
    
    private static func testTypographyStyle(label view: UILabel, style: TypographyStyle) {
        for property in style.allProperties {
            self.testTypographyProperty(label: view, property: property)
        }
    }
    
    private static func testTypographyProperty(label view: UILabel, property: TypographyStyle.T) {
        it("TypographyStyle-\(property)", closure: {
            switch property {
            case .backgroundColor(let value):
                expect(view.backgroundColor).to(equal(value))
            case .font(let value):
                expect(view.font).to(equal(value))
            case .foregroundColor(let value):
                expect(view.textColor).to(equal(value))
            case .paragraphStyle(let value):
                expect(view.textAlignment).to(equal(value.alignment))
                expect(view.lineBreakMode).to(equal(value.lineBreakMode))
            case .attachment: fallthrough
            case .baselineOffset: fallthrough
            case .expansion: fallthrough
            case .kern: fallthrough
            case .ligature: fallthrough
            case .link: fallthrough
            case .obliqueness: fallthrough
            case .shadow: fallthrough
            case .strikethroughColor: fallthrough
            case .strikethroughStyle: fallthrough
            case .strokeColor: fallthrough
            case .strokeWidth: fallthrough
            case .textEffect: fallthrough
            case .underlineColor: fallthrough
            case .underlineStyle: fallthrough
            case .verticalGlyphForm: fallthrough
            case .writingDirection:
                break
            }
        })
    }
    
}
