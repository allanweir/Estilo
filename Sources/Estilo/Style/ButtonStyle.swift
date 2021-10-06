//
//  ButtonStyle.swift
//  Estilo
//
//  Created by Allan Weir on 29/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public extension Styles {
    
    enum Button: StyleProperty {
        case view(ViewStyle)
        case viewProperty(View)
        case label(LabelStyle)
        case labelProperty(Label)
        case typography(TypographyStyle)
        
        case adjustsImageWhenHighlighted(Bool)
        case adjustsImageWhenHDisabled(Bool)
        case backgroundImage(UIImage, UIControl.State)
        case contentEdgeInsets(UIEdgeInsets)
        case image(UIImage, UIControl.State)
        case imageEdgeInsets(UIEdgeInsets)
        case reversesTitleShadowWhenHighlighted(Bool)
        case showsTouchWhenHighlighted(Bool)
        case tintColor(UIColor)
        case title(String, UIControl.State)
        case titleColor(UIColor, UIControl.State)
        case titleEdgeInsets(UIEdgeInsets)
        case titleShadowColor(UIColor, UIControl.State)
        
        public static func ==(lhs: Styles.Button, rhs: Styles.Button) -> Bool {
            switch (lhs, rhs) {
            case (.view, .view): fallthrough //TODO: Assess impact of only allowing one view style set
            case (.label, .label): fallthrough //TODO: Assess impact of only allowing one label style set
            case (.typography, .typography): fallthrough //TODO: Assess impact of only allowing one typographic style set
            case (.adjustsImageWhenHighlighted, .adjustsImageWhenHighlighted): fallthrough
            case (.adjustsImageWhenHDisabled, .adjustsImageWhenHDisabled): fallthrough
            case (.contentEdgeInsets, .contentEdgeInsets): fallthrough
            case (.imageEdgeInsets, .imageEdgeInsets): fallthrough
            case (.reversesTitleShadowWhenHighlighted, .reversesTitleShadowWhenHighlighted): fallthrough
            case (.showsTouchWhenHighlighted, .showsTouchWhenHighlighted): fallthrough
            case (.tintColor, .tintColor): fallthrough
            case (.titleEdgeInsets, .titleEdgeInsets):
                return true
            case (.backgroundImage(_, let state1), .backgroundImage(_, let state2)):
                return state1 == state2
            case (.image(_, let state1), .image(_, let state2)):
                return state1 == state2
            case (.title(_, let state1), .title(_, let state2)):
                return state1 == state2
            case (.titleColor(_, let state1), .titleColor(_, let state2)):
                return state1 == state2
            case (.titleShadowColor(_, let state1), .titleShadowColor(_, let state2)):
                return state1 == state2
            case (.viewProperty(let lhsProperty), viewProperty(let rhsProperty)):
                return lhsProperty == rhsProperty
            case (.labelProperty(let lhsProperty), labelProperty(let rhsProperty)):
                return lhsProperty == rhsProperty
            default:
                return false
            }
        }
    }
}

public class ButtonStyle: BaseStyle<Styles.Button>, StyleContainer {
    
    public required init(inherits parent: ButtonStyle? = nil, properties: StyleProperties) {
        super.init(inherits: parent, properties: properties)
    }
    
}

extension ButtonStyle {
    
    static let test = ButtonStyle(properties: [
        
    ])
    
}
