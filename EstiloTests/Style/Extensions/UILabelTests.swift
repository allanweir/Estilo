//
//  UILabelTests.swift
//  EstiloTests
//
//  Created by Allan Weir on 05/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Quick
import Nimble
@testable import Estilo

class UILabelTests: QuickSpec {
    
    override func spec() {
        describe("UILabel") {
            
            let label = UILabel()
            
            let labelStyle = LabelStyle(inherits: nil, properties: [
                .textColor: UIColor.green,
                .textAlignment: NSTextAlignment.right,
                .numberOfLines: 3
            ])
            
            context("applies Label style", closure: {
                self.test(label: label, style: labelStyle)
            })
            
        }
    }
    
    private func test(label: UILabel, style: LabelStyle) {
        label.apply(style: style)
        for (property, value) in style.allProperties {
            it("\(property)", closure: {
                switch property {
                case .textColor:
                    expect(label.textColor).to(equal(Parser.parse(value)))
                case .textAlignment:
                    expect(label.textAlignment).to(equal(Parser.parse(value)))
                case .numberOfLines:
                    expect(label.numberOfLines).to(equal(Parser.parse(value)))
                default:
                    break
                }
            })
        }
    }
    
}
