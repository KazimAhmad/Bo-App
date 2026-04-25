//
//  UserEndpoint.swift
//  Bo
//
//  Created by Kazim Ahmad on 25/04/2026.
//

import Foundation

struct CreateUser: Encodable {
    let username: String
    let email: String
    let password: String
}

enum UserEndpoint: Endpoint {
    case create(CreateUser)

    var path: String {
        switch self {
        case .create:
            return "/users/sign-up"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .create:
            return .post
        }
    }
    
    var headers: [String : String]? { nil }
    
    var query: [String : Any]? { nil }
    
    var body: HTTPBody? {
        switch self {
        case .create(let user):
            return .json(user)
        }
    }
}
