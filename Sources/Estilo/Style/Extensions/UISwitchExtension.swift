//
//  UISwitchExtension.swift
//  Estilo
//
//  Created by Allan Weir on 29/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

extension UISwitch {
    public typealias StyleType = SwitchStyle
    
    public static func apply(toView view: UISwitch, styles: SwitchStyle...) {
        styles.forEach { (style) in
            self.apply(toView: view, style: style)
        }
    }
    
    public static func apply(toView view: UISwitch, style: SwitchStyle) {
        for property in style.allProperties {
            self.apply(toView: view, property: property)
        }
    }
    
    public static func apply(toView view: UISwitch, property: Styles.Switch) {
        switch property {
        case .view(let value):
            self.apply(toView: view, style: value)
        case .viewProperty(let value):
            self.apply(toView: view, property: value)
        case .isOn(let value):
            view.isOn = value
        case .thumbTintColor(let value):
            view.thumbTintColor = value
        case .tintColor(let value):
            view.tintColor = value
        case .onTintColor(let value):
            view.onTintColor = value
        }
    }
    
    public func apply(styles: SwitchStyle...) {
        styles.forEach { (style) in
            UISwitch.apply(toView: self, style: style)
        }
    }
    
    public func apply(style: SwitchStyle) {
        UISwitch.apply(toView: self, style: style)
    }

}
