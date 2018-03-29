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
        for property in style.allProperties {
            self.apply(toView: view, property: property)
        }
    }
    
    public static func apply(toView view: UIView, property: Styles.View) {
        switch property {
        case .alpha(let value):
            view.alpha = value
        case .autoresizingMask(let value):
            view.autoresizingMask = value
        case .autoresizesSubviews(let value):
            view.autoresizesSubviews = value
        case .backgroundColor(let value):
            view.backgroundColor = value
        case .borderColor(let value):
            view.layer.borderColor = value.cgColor
        case .borderWidth(let value):
            view.layer.borderWidth = value
        case .bounds(let value):
            view.bounds = value
        case .center(let value):
            view.center = value
        case .clearsContextBeforeDrawing(let value):
            view.clearsContextBeforeDrawing = value
        case .clipsToBounds(let value):
            view.clipsToBounds = value
        case .contentMode(let value):
            view.contentMode = value
        case .frame(let value):
            view.frame = value
        case .isHidden(let value):
            view.isHidden = value
        case .isOpaque(let value):
            view.isOpaque = value
        case .isExclusiveTouch(let value):
            view.isExclusiveTouch = value
        case .isMultipleTouchEnabled(let value):
            view.isMultipleTouchEnabled = value
        case .isUserInteractionEnabled(let value):
            view.isUserInteractionEnabled = value
        case .transform(let value):
            view.transform = value
        case .tintColor(let value):
            view.tintColor = value
        case .tintAdjustmentMode(let value):
            view.tintAdjustmentMode = value
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
