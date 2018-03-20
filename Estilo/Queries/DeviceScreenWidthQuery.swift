//
//  DeviceScreenWidthQuery.swift
//  Estilo
//
//  Created by Allan Weir on 02/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public extension DeviceScreenWidthQuery.ScreenWidth {
    static let iPhone3point5Inch: CGFloat = 320
    static let iPhone4Inch: CGFloat = 320
    static let iPhone4point7Inch: CGFloat = 375
    static let iPhone5point5Inch: CGFloat = 414
}

public struct DeviceScreenWidthQuery: Query {
    
    public typealias ScreenWidth = CGFloat
    
    public var scope: QueryScope { return .device }
    public private(set) var screenWidth: ScreenWidth
    public private(set) var comparator: CGFloat.ComparatorFunction
    
    public init(_ comparator: @escaping CGFloat.ComparatorFunction, _ screenWidth: ScreenWidth) {
        self.comparator = comparator
        self.screenWidth = screenWidth
    }
    
    public func isApplicable() -> Bool {
        return self.comparator(UIScreen.main.fixedCoordinateSpace.bounds.size.width, self.screenWidth)
    }
}
