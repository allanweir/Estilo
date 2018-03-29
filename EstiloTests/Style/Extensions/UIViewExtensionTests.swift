//
//  UIViewExtensionTests.swift
//  EstiloTests
//
//  Created by Allan Weir on 20/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Quick
import Nimble
@testable import Estilo

class UIViewExtensionTests: QuickSpec {
    
    override func spec() {
        describe("UIView") {
            
            let view = UIView()
            
            let testStyle = ViewStyle(inherits: nil, properties: [
                .backgroundColor(.green)
            ])
            
            view.apply(style: testStyle)
            context("applies View style", closure: {
                UIViewExtensionTests.testStyle(view: view, style: testStyle)
            })
            
        }
    }
    
    static func testStyle(view: UIView, style: ViewStyle) {
        for property in style.allProperties {
            self.testProperty(view: view, property: property)
        }
    }
    
    static func testProperty(view: UIView, property: ViewStyle.T) {
        it("\(property)", closure: {
            switch property {
            case .alpha(let value):
                expect(view.alpha).to(equal(value))
            case .autoresizingMask(let value):
                expect(view.autoresizingMask).to(equal(value))
            case .autoresizesSubviews(let value):
                expect(view.autoresizesSubviews).to(equal(value))
            case .backgroundColor(let value):
                expect(view.backgroundColor).to(equal(value))
            case .borderColor(let value):
                expect(view.layer.borderColor).to(equal(value.cgColor))
            case .borderWidth(let value):
                expect(view.layer.borderWidth).to(equal(value))
            case .bounds(let value):
                expect(view.bounds).to(equal(value))
            case .center(let value):
                expect(view.center).to(equal(value))
            case .clearsContextBeforeDrawing(let value):
                expect(view.clearsContextBeforeDrawing).to(equal(value))
            case .clipsToBounds(let value):
                expect(view.clipsToBounds).to(equal(value))
            case .contentMode(let value):
                expect(view.contentMode).to(equal(value))
            case .frame(let value):
                expect(view.frame).to(equal(value))
            case .isHidden(let value):
                expect(view.isHidden).to(equal(value))
            case .isOpaque(let value):
                expect(view.isOpaque).to(equal(value))
            case .isExclusiveTouch(let value):
                expect(view.isExclusiveTouch).to(equal(value))
            case .isMultipleTouchEnabled(let value):
                expect(view.isMultipleTouchEnabled).to(equal(value))
            case .isUserInteractionEnabled(let value):
                expect(view.isUserInteractionEnabled).to(equal(value))
            case .transform(let value):
                expect(view.transform).to(equal(value))
            case .tintColor(let value):
                expect(view.tintColor).to(equal(value))
            case .tintAdjustmentMode(let value):
                expect(view.tintAdjustmentMode).to(equal(value))
            }
        })
    }
}
