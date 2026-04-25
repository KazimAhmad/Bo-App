//
//  UserRepo.swift
//  Bo
//
//  Created by Kazim Ahmad on 25/04/2026.
//

import Foundation

class UserRepo {
    func createUser(user: CreateUser) async throws {
        try await SwiftServices().createUser(on: UserEndpoint.create(user))
    }
}
