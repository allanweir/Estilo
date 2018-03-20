//
//  DeviceTypeQueryTests.swift
//  EstiloTests
//
//  Created by Allan Weir on 05/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Quick
import Nimble
@testable import Estilo

class DeviceTypeQueryTests: QuickSpec {
    
    override func spec() {
        describe("DeviceTypeQuery") {
            let isiPad = UIDevice.current.userInterfaceIdiom == .pad
            let isiPhone = UIDevice.current.userInterfaceIdiom == .phone
            
            context("query", closure: {
                it("scope is: device based", closure: {
                    let query = DeviceTypeQuery.iPhone
                    expect(query.scope).to(equal(QueryScope.device))
                })
            })
            
            context("tests device", closure: {
                    
                it("is an iPhone using init", closure: {
                    let query = DeviceTypeQuery(.iPhone)
                    expect(query.isApplicable()).to(equal(isiPhone))
                })
                
                it("is an iPad using init", closure: {
                    let query = DeviceTypeQuery(.iPad)
                    expect(query.isApplicable()).to(equal(isiPad))
                })
                
                it("is an iPhone or iPad using init", closure: {
                    let query = DeviceTypeQuery(.iPhone, .iPad)
                    expect(query.isApplicable()).to(equal(isiPhone || isiPad))
                })
                
                it("is an iPhone using constant", closure: {
                    let query = DeviceTypeQuery.iPhone
                    expect(query.isApplicable()).to(equal(isiPhone))
                })
                
                it("is an iPad using constant", closure: {
                    let query = DeviceTypeQuery.iPad
                    expect(query.isApplicable()).to(equal(isiPad))
                })
                
                it("is an iPhone or iPad using constant", closure: {
                    let query = DeviceTypeQuery.iPhoneAndiPad
                    expect(query.isApplicable()).to(equal(isiPhone || isiPad))
                })
            })
        }
    }
    
}
