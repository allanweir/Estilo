//
//  UIDeviceExtension.swift
//  Estilo
//
//  Created by Allan Weir on 02/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

extension UIDevice {
    
    var isiPhone: Bool {
        return self.userInterfaceIdiom == .phone
    }
    
    var isiPad: Bool {
        return self.userInterfaceIdiom == .pad
    }
    
}
