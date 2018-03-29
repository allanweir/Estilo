//
//  BaseStyle.swift
//  Estilo
//
//  Created by Allan Weir on 28/02/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

public class BaseStyle<S: StyleProperty>: BaseStyleContainer {
    public typealias T = S
    
    public var globalProperties: StyleProperties
    private var sessionProperties: [(query: Query, properties: StyleProperties)]
    
    public var queryProperties:  StyleProperties {
        var properties: StyleProperties = StyleProperties()
        for sessionQuery in self.sessionProperties {
            if sessionQuery.query.isApplicable() {
                properties.append(contentsOf: sessionQuery.properties)
            }
        }
        return properties.uniqueLatest()
    }
    
    public var allProperties: StyleProperties {
        var properties = self.globalProperties
        properties.append(contentsOf: self.queryProperties)
        return properties.uniqueLatest()
    }
    
    // MARK: - Init
    
    public init(inherits parent: BaseStyle<T>? = nil, properties: StyleProperties) {
        if let parent = parent {
            self.globalProperties = parent.globalProperties
            self.globalProperties.append(contentsOf: properties)
            self.globalProperties = self.globalProperties.uniqueLatest()
        } else {
            self.globalProperties = properties
        }
        
        self.sessionProperties = parent?.sessionProperties ?? []
    }
    
    // MARK: - Queries
    
    public func query(_ query: Query, _ properties: StyleProperties) -> Self {
        return self.query([query], properties)
    }
    
    public func query(_ queries: [Query], _ properties: StyleProperties) -> Self {
        for query in queries {
            if query.scope == .device, query.isApplicable() {
                self.globalProperties.append(contentsOf: properties)
                self.globalProperties = self.globalProperties.uniqueLatest()
            } else {
                self.sessionProperties.append((query: query, properties: properties))
            }
        }
        
        return self
    }
    
}
