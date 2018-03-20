//
//  Style.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

public protocol BaseStyleContainer {
    associatedtype T: Hashable
    typealias StyleProperties = [T: Any]
    
    var globalProperties: StyleProperties { get set }
    var queryProperties: StyleProperties { get }
    var allProperties: StyleProperties { get }
    
    func query(_ query: Query, _ properties: StyleProperties) -> Self
    func query(_ queries: [Query], _ properties: StyleProperties) -> Self
    
}

public protocol StyleContainer: BaseStyleContainer {
    init(inherits parent: Self?, properties: StyleProperties)
}


public struct Styles {
    
}


protocol PropertyName: Hashable {
    
}

enum TestPropertyType: String, PropertyName {
    case test
}
