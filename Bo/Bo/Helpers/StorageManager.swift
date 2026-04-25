//
//  StorageManager.swift
//  Bo
//
//  Created by Kazim Ahmad on 24/04/2026.
//

import SwiftUI

enum AppIcon: String, CaseIterable {
    case AppIcon
    case AppIcon1
    case AppIcon2
    
    var logo: Image {
        switch self {
        case .AppIcon:
            return Image("logo")
        case .AppIcon1:
            return Image("logo1")
        case .AppIcon2:
            return Image("logo2")
        }
    }
}

enum UserDefaultsKeys: String, CaseIterable {
    case currentAppIcon
}

class StorageManager {
    static var shared = StorageManager()
    
    var currentAppIcon: String? {
        get { userDefaults(get: String.self,
                           for: UserDefaultsKeys.currentAppIcon.rawValue ) }
        set { userDefaults(set: newValue,
                           for: UserDefaultsKeys.currentAppIcon.rawValue) }
    }
    
    private func userDefaults<T>(set value: T?,
                              for key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    private func userDefaults<T>(get type: T.Type,
                                 for key: String) -> T? {
        UserDefaults.standard.value(forKey: key) as? T
    }
    
    func updateAppIcon() {
        if let appIcon = currentAppIcon {
            if appIcon == AppIcon.AppIcon1.rawValue {
                currentAppIcon = AppIcon.AppIcon2.rawValue
            } else if appIcon == AppIcon.AppIcon2.rawValue {
                currentAppIcon = nil
            }
        } else {
            currentAppIcon = AppIcon.AppIcon1.rawValue
        }
        Task { @MainActor in
              UIApplication.shared.setAlternateIconName(currentAppIcon)
        }
    }
}
