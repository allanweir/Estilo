//
//  LabelStyle.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

public extension Styles {
    
    public enum Label: String, Hashable {
        case typography
        case textColor
        case textAlignment
        case numberOfLines
        
        //Inherited
        case backgroundColor
        case borderColor
        case borderWidth
    }
}

public class LabelStyle: BaseStyle<Styles.Label>, StyleContainer {
    
    public required init(inherits parent: LabelStyle? = nil, properties: StyleProperties) {
        super.init(inherits: parent, properties: properties)
    }
    
}

extension LabelStyle {
    
    static let test = LabelStyle(properties: [
        .textColor: UIColor.blue
    ])

    static let plainCellValueDark = LabelStyle(inherits: .test, properties: [
        :
    ]).query(DeviceTypeQuery(.iPhone), [
        :
    ]).query(DeviceScreenScaleQuery(>=, 2), [
        :
    ])
}
