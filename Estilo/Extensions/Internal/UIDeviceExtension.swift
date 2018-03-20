//
//  UIDeviceExtension.swift
//  Estilo
//
//  Created by Allan Weir on 02/03/2018.
//  Copyright © 2018 Studious. All rights reserved.
//

import UIKit

extension UIDevice {
    
    static var isiPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var isiPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
}
