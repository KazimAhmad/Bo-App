//
//  SignUpViewModel.swift
//  Bo
//
//  Created by Kazim Ahmad on 23/04/2026.
//

import Combine
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
}
