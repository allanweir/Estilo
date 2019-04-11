//
//  NSMutableAttributedString.swift
//  Estilo
//
//  Created by Allan Weir on 01/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import Foundation

extension NSMutableAttributedString: TypographyStyleable {

    public func apply(styles: TypographyStyle...) {
        guard let range = NSRange(self.string) else {
            return
        }
        self.apply(styles: styles, toRange: range)
    }
    
    public func apply(style: TypographyStyle) {
        guard let range = NSRange(self.string) else {
            return
        }
        self.apply(style: style, toRange: range)
    }
    
    // MARK: - Convenience methods for target a range
    
    public func apply(styles: [TypographyStyle], toRange range: NSRange) {
        var attributes: [NSAttributedString.Key: Any] = [:]
        styles.forEach { (style) in
            NSMutableAttributedString.update(attributes: &attributes, from: style)
        }
        self.addAttributes(attributes, range: range)
    }
    
    public func apply(style: TypographyStyle, toRange range: NSRange) {
        self.addAttributes(NSMutableAttributedString.createAttributes(from: style), range: range)
    }
    
}
