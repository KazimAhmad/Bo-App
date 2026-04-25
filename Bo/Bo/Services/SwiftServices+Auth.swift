//
//  SwiftServices+Auth.swift
//  Bo
//
//  Created by Kazim Ahmad on 22/04/2026.
//

import Foundation

extension SwiftServices {
    func goForLogin() {
        self.userSession.isAuthenticating = true
    }
    
    func createUser(on userEndpoint: UserEndpoint) async throws {
        try await request(endpoint: userEndpoint)
    }
}
