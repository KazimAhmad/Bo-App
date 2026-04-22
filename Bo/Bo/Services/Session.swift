//
//  Session.swift
//  Bo
//
//  Created by Kazim Ahmad on 22/04/2026.
//

import Foundation

@Observable
class Session {
    static let current = Session()

    var isAuthenticated: Bool = false
    var guest: Bool = false
    
    func logout() {
        isAuthenticated = false
        guest = false
    }
    
    func skipLogin() {
        guest = true
    }
}
