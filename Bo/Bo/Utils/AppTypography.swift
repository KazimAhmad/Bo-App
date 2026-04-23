//
//  AppTypography.swift
//  Swag
//
//  Created by Kazim Ahmad on 15/01/2026.
//

import SwiftUI

enum AppTypography {
    static func bold(size: CGFloat) -> Font {
        Font.custom("DynaPuff-SemiBold",
                    size: size,
                    relativeTo: .title)
    }
    
    static func bold16() -> Font {
        Font.custom("DynaPuff-SemiBold",
                    size: 16.0,
                    relativeTo: .title)
    }
    
    static func bold18() -> Font {
        Font.custom("DynaPuff-SemiBold",
                    size: 18.0,
                    relativeTo: .title)
    }
    
    static func bold20() -> Font {
        Font.custom("DynaPuff-SemiBold",
                    size: 20.0,
                    relativeTo: .title)
    }
}

extension AppTypography {
    static func medium(size: CGFloat) -> Font {
        Font.custom("DynaPuff-Medium",
                    size: size,
                    relativeTo: .title)
    }
    
    static func mediumApp() -> Font {
        Font.custom("DynaPuff-Medium",
                    size: 16.0,
                    relativeTo: .title)
    }
    
    static func medium14() -> Font {
        Font.custom("DynaPuff-Medium",
                    size: 14.0,
                    relativeTo: .title)
    }
    
    static func medium18() -> Font {
        Font.custom("DynaPuff-Medium",
                    size: 18.0,
                    relativeTo: .title)
    }
}

extension AppTypography {
    static func regular(size: CGFloat) -> Font {
        Font.custom("DynaPuff-Regular",
                    size: size,
                    relativeTo: .title)
    }
    
    static func regularApp() -> Font {
        Font.custom("DynaPuff-Regular",
                    size: 16.0,
                    relativeTo: .title)
    }
    
    static func regular14() -> Font {
        Font.custom("DynaPuff-Regular",
                    size: 14.0,
                    relativeTo: .title)
    }
    
    static func regular12() -> Font {
        Font.custom("DynaPuff-Regular",
                    size: 12.0,
                    relativeTo: .title)
    }
}

extension AppTypography {
    static func light(size: CGFloat) -> Font {
        Font.custom("ShadowsIntoLightTwo-Regular",
                    size: size,
                    relativeTo: .title)
    }
    
    static func lightApp() -> Font {
        Font.custom("ShadowsIntoLightTwo-Regular",
                    size: 16.0,
                    relativeTo: .title)
    }
    
    static func light14() -> Font {
        Font.custom("ShadowsIntoLightTwo-Regular",
                    size: 14.0,
                    relativeTo: .title)
    }
    
    static func light12() -> Font {
        Font.custom("ShadowsIntoLightTwo-Regular",
                    size: 12.0,
                    relativeTo: .title)
    }
}

//MARK: Fonts for components
extension AppTypography {
    static func button() -> Font {
        Font.custom("DynaPuff-Regular",
                    size: 16.0,
                    relativeTo: .title)
    }
}
