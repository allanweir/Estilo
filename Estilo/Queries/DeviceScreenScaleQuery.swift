//
//  DeviceScreenScaleQuery.swift
//  Estilo
//
//  Created by Allan Weir on 02/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public struct DeviceScreenScaleQuery: Query {

    public var scope: QueryScope { return .device }
    public private(set) var scale: CGFloat
    public private(set) var comparator: CGFloat.ComparatorFunction
    
    public init(_ comparator: @escaping CGFloat.ComparatorFunction, _ scale: CGFloat) {
        self.comparator = comparator
        self.scale = scale
    }
    
    public func isApplicable() -> Bool {
        return self.comparator(UIScreen.main.scale, self.scale)
    }
    
    public static let nonRetinaOnly = DeviceScreenScaleQuery(==, 1)
    public static let retinaOnly = DeviceScreenScaleQuery(==, 2)
    public static let superRetinaOnly = DeviceScreenScaleQuery(==, 3)
    
}
