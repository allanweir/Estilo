//
//  LabelStyle.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public extension Styles {
    
    enum Label: StyleProperty {
        case view(ViewStyle)
        case viewProperty(View)
        case typography(TypographyStyle)
        
        case allowsDefaultTighteningForTruncation(Bool)
        case adjustsFontSizeToFitWidth(Bool)
        case baselineAdjustment(UIBaselineAdjustment)
        case font(UIFont)
        case highlightedTextColor(UIColor)
        case isHighlighted(Bool)
        case lineBreakMode(NSLineBreakMode)
        case minimumScaleFactor(CGFloat)
        case numberOfLines(Int)
        case preferredMaxLayoutWidth(CGFloat)
        case shadowColor(UIColor)
        case shadowOffset(CGSize)
        case textAlignment(NSTextAlignment)
        case textColor(UIColor)
        
        public static func ==(lhs: Styles.Label, rhs: Styles.Label) -> Bool {
            switch (lhs, rhs) {
            case (.view, .view): fallthrough //TODO: Assess impact of only allowing one view style set
            case (.typography, .typography): fallthrough //TODO: Assess impact of only allowing one typographic style set
            case (.allowsDefaultTighteningForTruncation, .allowsDefaultTighteningForTruncation): fallthrough
            case (.adjustsFontSizeToFitWidth, .adjustsFontSizeToFitWidth): fallthrough
            case (.baselineAdjustment, .baselineAdjustment): fallthrough
            case (.font, .font): fallthrough
            case (.highlightedTextColor, .highlightedTextColor): fallthrough
            case (.isHighlighted, .isHighlighted): fallthrough
            case (.lineBreakMode, .lineBreakMode): fallthrough
            case (.minimumScaleFactor, .minimumScaleFactor): fallthrough
            case (.numberOfLines, .numberOfLines): fallthrough
            case (.preferredMaxLayoutWidth, .preferredMaxLayoutWidth): fallthrough
            case (.shadowColor, .shadowColor): fallthrough
            case (.shadowOffset, .shadowOffset): fallthrough
            case (.textAlignment, .textAlignment): fallthrough
            case (.textColor, .textColor):
                return true
            case (.viewProperty(let lhsProperty), viewProperty(let rhsProperty)):
                return lhsProperty == rhsProperty
            default:
                return false
            }
        }
    }
}

public class LabelStyle: BaseStyle<Styles.Label>, StyleContainer {
    
    public required init(inherits parent: LabelStyle? = nil, properties: StyleProperties) {
        super.init(inherits: parent, properties: properties)
    }
    
}

extension LabelStyle {
    
    static let test = LabelStyle(properties: [
        .textColor(.blue)
    ])
    
}
