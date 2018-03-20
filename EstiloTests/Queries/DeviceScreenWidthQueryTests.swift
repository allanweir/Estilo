//
//  DeviceScreenWidthQueryTests.swift
//  EstiloTests
//
//  Created by Allan Weir on 05/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Quick
import Nimble
@testable import Estilo

class DeviceScreenWidthQueryTests: QuickSpec {
    
    override func spec() {
        describe("DeviceScreenWidthQuery") {
            
            context("query", closure: {
                it("scope is: device based", closure: {
                    let query = DeviceScreenWidthQuery(<, 320)
                    expect(query.scope).to(equal(QueryScope.device))
                })
            })
            
            let screenWidth = UIScreen.main.fixedCoordinateSpace.bounds.size.width
            context("tests screen width \(screenWidth)", closure: {
                let widths: [CGFloat] = [320, 480, 680, 1024]
                
                for width in widths {
                    
                    it("is less than \(width)", closure: {
                        let query = DeviceScreenWidthQuery(<, width)
                        expect(query.isApplicable()).to(equal(screenWidth < width))
                    })
                    
                    it("is less than or equal to \(width)", closure: {
                        let query = DeviceScreenWidthQuery(<=, width)
                        expect(query.isApplicable()).to(equal(screenWidth <= width))
                    })
                    
                    it("is equal to \(width)", closure: {
                        let query = DeviceScreenWidthQuery(==, width)
                        expect(query.isApplicable()).to(equal(screenWidth == width))
                    })
                    
                    it("is greater than \(width)", closure: {
                        let query = DeviceScreenWidthQuery(>, width)
                        expect(query.isApplicable()).to(equal(screenWidth > width))
                    })
                    
                    it("is greater than or equal to \(width)", closure: {
                        let query = DeviceScreenWidthQuery(>=, width)
                        expect(query.isApplicable()).to(equal(screenWidth >= width))
                    })
                }
            })
        }
    }
    
}
