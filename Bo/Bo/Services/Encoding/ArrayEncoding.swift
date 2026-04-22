//
//  ArrayEncoding.swift
//  Bo
//
//  Created by Kazim Ahmad on 22/04/2026.
//

import Foundation

//MARK: -To handle the Any type of query
public enum ArrayEncoding {
    case brackets, noBrackets

    func encode(key: String) -> String {
        switch self {
        case .brackets:
            return "\(key)[]"
        case .noBrackets:
            return key
        }
    }
}
