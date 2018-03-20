//
//  ParserTests.swift
//  EstiloTests
//
//  Created by Allan Weir on 14/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Quick
import Nimble
@testable import Estilo

class ParserTests: QuickSpec {
    
    override func spec() {
        describe("Parser") {
            
            context("should parse", closure: {
                self.testPass(label: "color", value: UIColor.blue, type: UIColor.self)
                self.testPass(label: "textAlignment", value: NSTextAlignment.center, type: NSTextAlignment.self)
                self.testPass(label: "cgfloat", value: CGFloat(2), type: CGFloat.self)
                self.testPass(label: "double", value: Double(2), type: Double.self)
                self.testPass(label: "int", value: Int(2), type: Int.self)
            })
            
            context("should fail to parse", closure: {
                self.testFail(label: "color", value: 2, type: UIColor.self)
                self.testFail(label: "textAlignment", value: "test", type: NSTextAlignment.self)
                self.testFail(label: "cgfloat", value: UIColor.red, type: CGFloat.self)
                self.testFail(label: "double", value: Int(2), type: Double.self)
                self.testFail(label: "int", value: "test", type: Int.self)
            })
        }
    }
    
    private func testPass<T: Any>(label: String, value: Any, type: T.Type) {
        it("\(label) from Any", closure: {
            let result: T? = Parser.parse(value)
            expect(result).notTo(beNil())
        })
    }
    
    private func testFail<T: Any>(label: String, value: Any, type: T.Type) {
        it("\(label) from any", closure: {
            let result: T? = Parser.parse(value)
            expect(result).to(beNil())
        })
    }
    
}
