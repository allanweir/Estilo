//
//  DeviceScreenScaleQueryTests.swift
//  EstiloTests
//
//  Created by Allan Weir on 05/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Quick
import Nimble
@testable import Estilo

class DeviceScreenScaleQueryTests: QuickSpec {
    
    override func spec() {
        describe("DeviceScreenScaleQuery") {
            
            context("query", closure: {
                it("scope is: device based", closure: {
                    let query = DeviceScreenScaleQuery(<, 2)
                    expect(query.scope).to(equal(QueryScope.device))
                })
            })
            
            let screenScale = UIScreen.main.scale
            context("tests screen scale \(screenScale)", closure: {
                
                let scales: [CGFloat] = [1, 2, 3, 4]
                
                for scale in scales {
                
                    it("is less than \(scale)", closure: {
                        let query = DeviceScreenScaleQuery(<, scale)
                        expect(query.isApplicable()).to(equal(screenScale < scale))
                    })
                    
                    it("is less than or equal to \(scale)", closure: {
                        let query = DeviceScreenScaleQuery(<=, scale)
                        expect(query.isApplicable()).to(equal(screenScale <= scale))
                    })
                    
                    it("is equal to \(scale)", closure: {
                        let query = DeviceScreenScaleQuery(==, scale)
                        expect(query.isApplicable()).to(equal(screenScale == scale))
                    })
                    
                    it("is greater than \(scale)", closure: {
                        let query = DeviceScreenScaleQuery(>, scale)
                        expect(query.isApplicable()).to(equal(screenScale > scale))
                    })
                    
                    it("is greater than or equal to \(scale)", closure: {
                        let query = DeviceScreenScaleQuery(>=, scale)
                        expect(query.isApplicable()).to(equal(screenScale >= scale))
                    })
                }
                
                it("is non retina only constant", closure: {
                    let query = DeviceScreenScaleQuery.nonRetinaOnly
                    expect(query.isApplicable()).to(equal(screenScale == 1))
                })
                
                it("is retina only constant", closure: {
                    let query = DeviceScreenScaleQuery.retinaOnly
                    expect(query.isApplicable()).to(equal(screenScale == 2))
                })
                
                it("is super retina only constant", closure: {
                    let query = DeviceScreenScaleQuery.superRetinaOnly
                    expect(query.isApplicable()).to(equal(screenScale == 3))
                })
            })
        }
    }
    
}

