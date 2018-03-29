//
//  UILabelExtension.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

extension UILabel: TypographyStyleable, TypographyViewStyleable {
    public typealias StyleType = LabelStyle
    
    // MARK: - Apply to object
    
    public static func apply(toView view: UILabel, styles: LabelStyle...) {
        styles.forEach { (style) in
            self.apply(toView: view, style: style)
        }
    }
    
    public static func apply(toView view: UILabel, style: LabelStyle) {
        for property in style.allProperties {
            self.apply(toView: view, property: property)
        }
    }
    
    public static func apply(toView view: UILabel, property: Styles.Label) {
        switch property {
        case .view(let value):
            self.apply(toView: view, style: value)
        case .typography(let value):
            self.apply(toView: view, style: value)
        case .viewProperty(let value):
            self.apply(toView: view, property: value)
        
        case .allowsDefaultTighteningForTruncation(let value):
            view.allowsDefaultTighteningForTruncation = value
        case .adjustsFontSizeToFitWidth(let value):
            view.adjustsFontSizeToFitWidth = value
        case .baselineAdjustment(let value):
            view.baselineAdjustment = value
        case .font(let value):
            view.font = value
        case .highlightedTextColor(let value):
            view.highlightedTextColor = value
        case .isHighlighted(let value):
            view.isHighlighted = value
        case .lineBreakMode(let value):
            view.lineBreakMode = value
        case .minimumScaleFactor(let value):
            view.minimumScaleFactor = value
        case .numberOfLines(let value):
            view.numberOfLines = value
        case .preferredMaxLayoutWidth(let value):
            view.preferredMaxLayoutWidth = value
        case .shadowColor(let value):
            view.shadowColor = value
        case .shadowOffset(let value):
            view.shadowOffset = value
        case .textAlignment(let value):
            view.textAlignment = value
        case .textColor(let value):
            view.textColor = value
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
        for property in style.allProperties {
            switch property {
            case .backgroundColor(let value):
                view.backgroundColor = value
            case .font(let value):
                view.font = value
            case .foregroundColor(let value):
                view.textColor = value
            case .paragraphStyle(let value):
                view.textAlignment = value.alignment
                view.lineBreakMode = value.lineBreakMode
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
