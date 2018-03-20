//
//  UILabelExtension.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

extension UILabel: Styleable, TypographyStyleable, TypographyViewStyleable {
    public typealias StyleType = LabelStyle
    
    // MARK: - Apply to object
    
    public static func apply(toView view: UILabel, styles: LabelStyle...) {
        styles.forEach { (style) in
            self.apply(toView: view, style: style)
        }
    }
    
    public static func apply(toView view: UILabel, style: LabelStyle) {
        for (property, value) in style.allProperties {
            switch property {
            case .typography:
                if let typography: TypographyStyle = Parser.parse(value) {
                    self.apply(toView: view, style: typography)
                }
            case .textColor:
                view.textColor = Parser.parse(value)
            case .textAlignment:
                view.textAlignment = Parser.parse(value) ?? view.textAlignment
            case .numberOfLines:
                view.numberOfLines = Parser.parse(value) ?? view.numberOfLines
            case .backgroundColor: fallthrough
            case .borderColor: fallthrough
            case .borderWidth:
                if let style = Styles.View(rawValue: property.rawValue) {
                    
                }
            }
        }
    }
    
    public func apply(styles: LabelStyle...) {
        styles.forEach { (style) in
            UILabel.apply(toView: self, style: style)
        }
    }
    
    public func apply(style: LabelStyle) {
        UILabel.apply(toView: self, style: style)
    }
    
    // MARK: - Typography
    
    public static func apply(toView view: UILabel, styles: TypographyStyle...) {
        styles.forEach { (style) in
            self.apply(toView: view, style: style)
            
        }
    }
    
    public static func apply(toView view: UILabel, style: TypographyStyle) {
        for (property, value) in style.allProperties {
            switch property {
            case .backgroundColor:
                view.backgroundColor = Parser.parse(value)
            case .font:
                view.font = Parser.parse(value)
            case .foregroundColor, .textColor:
                view.textColor = Parser.parse(value)
            case .paragraphStyle:
                // TODO: Take attributes from paragraph style
                break
            case .attachment: fallthrough
            case .baselineOffset: fallthrough
            case .expansion: fallthrough
            case .kern: fallthrough
            case .ligature: fallthrough
            case .link: fallthrough
            case .obliqueness: fallthrough
            case .shadow: fallthrough
            case .strikethroughColor: fallthrough
            case .strikethroughStyle: fallthrough
            case .strokeColor: fallthrough
            case .strokeWidth: fallthrough
            case .textEffect: fallthrough
            case .underlineColor: fallthrough
            case .underlineStyle: fallthrough
            case .verticalGlyphForm: fallthrough
            case .writingDirection:
                break
            }
        }
    }
    
    public func apply(styles: TypographyStyle...) {
        styles.forEach { (style) in
            UILabel.apply(toView: self, style: style)
            
        }
    }
    
    public func apply(style: TypographyStyle) {
        UILabel.apply(toView: self, style: style)
    }
    
}
