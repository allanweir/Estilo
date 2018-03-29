//
//  SwitchStyle.swift
//  Estilo
//
//  Created by Allan Weir on 29/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public extension Styles {
    
    public enum Switch: StyleProperty {
        case view(ViewStyle)
        case viewProperty(View)
        
        case isOn(Bool)
        case thumbTintColor(UIColor)
        case tintColor(UIColor)
        case onTintColor(UIColor)
        
        public static func ==(lhs: Styles.Switch, rhs: Styles.Switch) -> Bool {
            switch (lhs, rhs) {
            case (.view, .view): fallthrough //TODO: Assess impact of only allowing one view style set
            case (.isOn, .isOn): fallthrough
            case (.thumbTintColor, .thumbTintColor): fallthrough
            case (.tintColor, .tintColor): fallthrough
            case (.onTintColor, .onTintColor):
                return true
            case (.viewProperty(let lhsProperty), viewProperty(let rhsProperty)):
                return lhsProperty == rhsProperty
            default:
                return false
            }
        }
    }
}

public class SwitchStyle: BaseStyle<Styles.Switch>, StyleContainer {
    
    public required init(inherits parent: SwitchStyle? = nil, properties: StyleProperties) {
        super.init(inherits: parent, properties: properties)
    }
    
}

extension SwitchStyle {
    
    static let test = SwitchStyle(properties: [
        
    ])
    
}
