//
//  SwagApp.swift
//  Bo
//
//  Created by Kazim Ahmad on 22/04/2026.
//

import Foundation

extension NSNumber {
    var isBool: Bool { return CFBooleanGetTypeID() == CFGetTypeID(self) }
}
