//
//  UIViewExtension.swift
//  Estilo
//
//  Created by Allan Weir on 19/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

extension UIView: Styleable {
    public typealias StyleType = ViewStyle
    
    // MARK: - Apply to object
    
    public static func apply(toView view: UIView, styles: ViewStyle...) {
        styles.forEach { (style) in
            self.apply(toView: view, style: style)
        }
    }
    
    public static func apply(toView view: UIView, style: ViewStyle) {
        for (property, value) in style.allProperties {
            switch property {
            case .backgroundColor:
                view.backgroundColor = Parser.parse(value)
            }
        }
    }
    
    public func apply(styles: ViewStyle...) {
        styles.forEach { (style) in
            UIView.apply(toView: self, style: style)
        }
    }
    
    public func apply(style: ViewStyle) {
        UIView.apply(toView: self, style: style)
    }
    
}
