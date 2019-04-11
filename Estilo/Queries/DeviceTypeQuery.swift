//
//  DeviceTypeQuery.swift
//  Estilo
//
//  Created by Allan Weir on 02/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public struct DeviceTypeQuery: Query {
    
    public enum DeviceType {
        case iPhone
        case iPad
    }
    
    public var scope: QueryScope { return .device }
    public private(set) var deviceType: [DeviceType]
    
    public init(_ devices: DeviceType...) {
        self.deviceType = devices
    }
    
    public func isApplicable() -> Bool {
        if UIDevice.current.isiPhone, self.deviceType.contains(.iPhone) {
            return true
        } else if UIDevice.current.isiPad, self.deviceType.contains(.iPad) {
            return true
        }
        return false
    }
    
    public static let iPhone = DeviceTypeQuery(.iPhone)
    public static let iPad = DeviceTypeQuery(.iPad)
    public static let iPhoneAndiPad = DeviceTypeQuery(.iPhone, .iPad)
    
}
