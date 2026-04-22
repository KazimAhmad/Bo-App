//
//  Int+Extension.swift
//  Bo
//
//  Created by Kazim Ahmad on 22/04/2026.
//

import Foundation

extension Int {
    var inString: String {
        if self < 1000 {
            return "\(self)"
        } else if self < 1_000_000 {
            return "\(Double(self) / 1000.0)k"
        } else {
            return "\(self / 1_000_000)M"
        }
    }
    
    var inStringWithoutZero: String {
        guard self > 0 else { return " " }
        if self < 1000 {
            return "\(self)"
        } else if self < 1_000_000 {
            return "\(Double(self) / 1000.0)k"
        } else {
            return "\(self / 1_000_000)M"
        }
    }
}
