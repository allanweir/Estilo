//
//  BaseStyle.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

public class BaseStyle<S: Hashable>: BaseStyleContainer {
    public typealias T = S
    
//    public typealias StyleProperties = [T: Any]
    
    public var globalProperties: StyleProperties
    private var sessionProperties: [(query: Query, properties: StyleProperties)]
    
    public var queryProperties:  StyleProperties {
        var properties: StyleProperties = StyleProperties()
        for sessionQuery in self.sessionProperties {
            if sessionQuery.query.isApplicable() {
                properties.update(withContentsOf: sessionQuery.properties)
            }
        }
        return properties
    }
    
    public var allProperties: StyleProperties {
        return self.globalProperties.updating(withContentsOf: self.queryProperties)
    }
    
    // MARK: - Init
    
    public init(inherits parent: BaseStyle<T>? = nil, properties: StyleProperties) {
        self.globalProperties = parent?.globalProperties ?? [:]
        self.globalProperties.update(withContentsOf: properties)
        
        self.sessionProperties = parent?.sessionProperties ?? []
    }
    
    // MARK: - Queries
    
    public func query(_ query: Query, _ properties: StyleProperties) -> Self {
        return self.query([query], properties)
    }
    
    public func query(_ queries: [Query], _ properties: StyleProperties) -> Self {
        for query in queries {
            if query.scope == .device, query.isApplicable() {
                self.globalProperties.update(withContentsOf: properties)
            } else {
                self.sessionProperties.append((query: query, properties: properties))
            }
        }
        
        return self
    }
    
}
