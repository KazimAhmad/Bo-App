//
//  SwiftServices+Auth.swift
//  Bo
//
//  Created by Kazim Ahmad on 22/04/2026.
//

import Foundation

extension SwiftServices {
    func enterAsGuest() {
        self.userSession.guest = true
    }
}
