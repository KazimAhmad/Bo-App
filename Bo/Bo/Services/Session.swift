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

    var isAuthenticating: Bool = false
    
    func logout() {
        isAuthenticating = false
    }
    
    func goingForLogin() {
        isAuthenticating = true
    }
}
