//
//  UIButtonExtension.swift
//  Estilo
//
//  Created by Allan Weir on 29/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

extension UIButton: TypographyStyleable, TypographyViewStyleable {
    public typealias StyleType = ButtonStyle
    
    // MARK: - Init
    
    public convenience init(title: String, style: ButtonStyle...) {
        self.init(type: .custom)
        for subStyle in style {
            self.apply(styles: subStyle)
        }
        self.setTitle(title, for: .normal)
    }
    
    public convenience init(image: UIImage, style: ButtonStyle...) {
        self.init(type: .custom)
        for subStyle in style {
            self.apply(styles: subStyle)
        }
        self.setImage(image, for: .normal)
    }
    
    // MARK: - Apply
    
    public static func apply(toView view: UIButton, styles: ButtonStyle...) {
        styles.forEach { (style) in
            self.apply(toView: view, style: style)
        }
    }
    
    public static func apply(toView view: UIButton, style: ButtonStyle) {
        for property in style.allProperties {
            self.apply(toView: view, property: property)
        }
    }
    
    public static func apply(toView view: UIButton, property: Styles.Button) {
        switch property {
        case .view(let value):
            self.apply(toView: view, style: value)
        case .label(let value):
            if let label = view.titleLabel {
                UILabel.apply(toView: label, style: value)
            }
        case .typography(let value):
            self.apply(toView: view, style: value)
        case .viewProperty(let value):
            self.apply(toView: view, property: value)
        case .labelProperty(let value):
            if let label = view.titleLabel {
                UILabel.apply(toView: label, property: value)
            }
        case .adjustsImageWhenHighlighted(let value):
            view.adjustsImageWhenHighlighted = value
        case .adjustsImageWhenHDisabled(let value):
            view.adjustsImageWhenDisabled = value
        case .backgroundImage(let value, let state):
            view.setBackgroundImage(value, for: state)
        case .contentEdgeInsets(let value):
            view.contentEdgeInsets = value
        case .image(let value, let state):
            view.setImage(value, for: state)
        case .imageEdgeInsets(let value):
            view.imageEdgeInsets = value
        case .reversesTitleShadowWhenHighlighted(let value):
            view.reversesTitleShadowWhenHighlighted = value
        case .showsTouchWhenHighlighted(let value):
            view.showsTouchWhenHighlighted = value
        case .tintColor(let value):
            view.tintColor = value
        case .title(let value, let state):
            view.setTitle(value, for: state)
        case .titleColor(let value, let state):
            view.setTitleColor(value, for: state)
        case .titleEdgeInsets(let value):
            view.titleEdgeInsets = value
        case .titleShadowColor(let value, let state):
            view.setTitleShadowColor(value, for: state)
        }
    }
    
    public func apply(styles: ButtonStyle...) {
        styles.forEach { (style) in
            UIButton.apply(toView: self, style: style)
        }
    }
    
    public func apply(style: ButtonStyle) {
        UIButton.apply(toView: self, style: style)
    }
    
    // MARK: - Typography
    
    public static func apply(toView view: UIButton, styles: TypographyStyle...) {
        styles.forEach { (style) in
            self.apply(toView: view, style: style)
            
        }
    }
    
    public static func apply(toView view: UIButton, style: TypographyStyle) {
        if let label = view.titleLabel {
            UILabel.apply(toView: label, style: style)
        }
    }
    
    public func apply(styles: TypographyStyle...) {
        styles.forEach { (style) in
            if let label = self.titleLabel {
                UILabel.apply(toView: label, style: style)
            }
        }
    }
    
    public func apply(style: TypographyStyle) {
        if let label = self.titleLabel {
            UILabel.apply(toView: label, style: style)
        }
    }

}
