//
//  ViewStyle.swift
//  Estilo
//
//  Created by Allan Weir on 19/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public extension Styles {

    public enum View: String, Hashable {
        case backgroundColor
    }
}

public class ViewStyle: BaseStyle<Styles.View>, StyleContainer {
    
    public required init(inherits parent: ViewStyle? = nil, properties: StyleProperties) {
        super.init(inherits: parent, properties: properties)
    }
    
}

extension ViewStyle {
    
}
