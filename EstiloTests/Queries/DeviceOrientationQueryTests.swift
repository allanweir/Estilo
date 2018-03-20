//
//  DeviceOrientationQueryTests.swift
//  EstiloTests
//
//  Created by Allan Weir on 15/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Estilo

class DeviceOrientationQueryTests: QuickSpec {
    
    override func spec() {
        describe("DeviceOrientationQuery") {
            
            context("query", closure: {
                it("scope is: session based", closure: {
                    let query = DeviceOrientationQuery.landscape
                    expect(query.scope).to(equal(QueryScope.session))
                })
            })
            
            let orientation = UIDevice.current.orientation
            let isLandscape = (orientation == .landscapeLeft || orientation == .landscapeRight)
            let isPortrait = (orientation == .portrait || orientation == .portraitUpsideDown)
            context("tests device", closure: {
                
                it("is landscape", closure: {
                    let query = DeviceOrientationQuery(.landscapeLeft, .landscapeRight)
                    expect(query.isApplicable()).to(equal(isLandscape))
                })
                
                it("is landscape left", closure: {
                    let query = DeviceOrientationQuery(.landscapeLeft)
                    expect(query.isApplicable()).to(equal(orientation == .landscapeLeft))
                })
                
                it("is landscape right", closure: {
                    let query = DeviceOrientationQuery(.landscapeRight)
                    expect(query.isApplicable()).to(equal(orientation == .landscapeRight))
                })
                
                it("is portrait", closure: {
                    let query = DeviceOrientationQuery(.portrait, .portraitUpsideDown)
                    expect(query.isApplicable()).to(equal(isPortrait))
                })
                
                it("is portrait right way only", closure: {
                    let query = DeviceOrientationQuery(.portrait)
                    expect(query.isApplicable()).to(equal(orientation == .portrait))
                })
                
                it("is portrait upside down only", closure: {
                    let query = DeviceOrientationQuery(.portraitUpsideDown)
                    expect(query.isApplicable()).to(equal(orientation == .portraitUpsideDown))
                })
                
                it("is landscape using constant", closure: {
                    let query = DeviceOrientationQuery.landscape
                    expect(query.isApplicable()).to(equal(isLandscape))
                })
                
                it("is portraitUp using constant", closure: {
                    let query = DeviceOrientationQuery.portraitUp
                    expect(query.isApplicable()).to(equal(orientation == .portrait))
                })
                
                it("is portraitUpAndDown using constant", closure: {
                    let query = DeviceOrientationQuery.portraitUpAndDown
                    expect(query.isApplicable()).to(equal(isPortrait))
                })
                
            })
        }
    }
    
}
