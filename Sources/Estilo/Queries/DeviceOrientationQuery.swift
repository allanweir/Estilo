//
//  DeviceOrientationQuery.swift
//  Estilo
//
//  Created by Allan Weir on 14/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

class DeviceOrientationQuery: Query {
    
    public var scope: QueryScope { return .session }
    public private(set) var orientations: [UIDeviceOrientation]
    
    public init(_ orientations: UIDeviceOrientation...) {
        self.orientations = orientations
    }
    
    public func isApplicable() -> Bool {
        return self.orientations.contains(UIDevice.current.orientation)
    }
    
    public static let landscape = DeviceOrientationQuery(.landscapeLeft, .landscapeRight)
    public static let portraitUp = DeviceOrientationQuery(.portrait)
    public static let portraitUpAndDown = DeviceOrientationQuery(.portrait, .portraitUpsideDown)
    
}
