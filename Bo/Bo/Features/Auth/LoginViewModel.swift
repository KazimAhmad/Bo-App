//
//  LoginViewModel.swift
//  Bo
//
//  Created by Kazim Ahmad on 23/04/2026.
//

import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
}
