//
//  ProfileViewModel.swift
//  Bo
//
//  Created by Kazim Ahmad on 24/04/2026.
//

import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var logo: Image = Image("logo")
    
    init() {
        updateLogo()
    }
    
    func switchImage() {
        StorageManager.shared.updateAppIcon()
        updateLogo()
    }
    
    private func updateLogo() {
        if let icon = AppIcon(rawValue: StorageManager.shared.currentAppIcon ?? "") {
            logo = icon.logo
        } else {
            logo = AppIcon.AppIcon.logo
        }
    }
}
