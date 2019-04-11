//
//  ViewStyle.swift
//  Estilo
//
//  Created by Allan Weir on 19/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public extension Styles {

    enum View: StyleProperty {
        case alpha(CGFloat)
        case autoresizingMask(UIView.AutoresizingMask)
        case autoresizesSubviews(Bool)
        case backgroundColor(UIColor)
        case borderColor(UIColor)
        case borderWidth(CGFloat)
        case bounds(CGRect)
        case center(CGPoint)
        case clearsContextBeforeDrawing(Bool)
        case clipsToBounds(Bool)
        case contentMode(UIView.ContentMode)
        case cornerRadius(CGFloat)
        case frame(CGRect)
        case isHidden(Bool)
        case isOpaque(Bool)
        case isExclusiveTouch(Bool)
        case isMultipleTouchEnabled(Bool)
        case isUserInteractionEnabled(Bool)
        case transform(CGAffineTransform)
        case tintColor(UIColor)
        case tintAdjustmentMode(UIView.TintAdjustmentMode)
        
        //TODO
        //case mask
        //case shadow
        
        public static func ==(lhs: Styles.View, rhs: Styles.View) -> Bool {
            switch (lhs, rhs) {
            case (.alpha, .alpha): fallthrough
            case (.autoresizingMask, .autoresizingMask): fallthrough
            case (.autoresizesSubviews, .autoresizesSubviews): fallthrough
            case (.backgroundColor, .backgroundColor): fallthrough
            case (.borderColor, .borderColor): fallthrough
            case (.borderWidth, .borderWidth): fallthrough
            case (.bounds, .bounds): fallthrough
            case (.center, .center): fallthrough
            case (.clearsContextBeforeDrawing, .clearsContextBeforeDrawing): fallthrough
            case (.clipsToBounds, .clipsToBounds): fallthrough
            case (.contentMode, .contentMode): fallthrough
            case (.cornerRadius, .cornerRadius): fallthrough
            case (.frame, .frame): fallthrough
            case (.isHidden, .isHidden): fallthrough
            case (.isOpaque, .isOpaque): fallthrough
            case (.isExclusiveTouch, .isExclusiveTouch): fallthrough
            case (.isMultipleTouchEnabled, .isMultipleTouchEnabled): fallthrough
            case (.isUserInteractionEnabled, .isUserInteractionEnabled): fallthrough
            case (.transform, .transform): fallthrough
            case (.tintColor, .tintColor): fallthrough
            case (.tintAdjustmentMode, .tintAdjustmentMode):
                return true
            default:
                return false
            }
        }
    }
}

public class ViewStyle: BaseStyle<Styles.View>, StyleContainer {
    
    public required init(inherits parent: ViewStyle? = nil, properties: StyleProperties) {
        super.init(inherits: parent, properties: properties)
    }
    
}

extension ViewStyle {
    
}
