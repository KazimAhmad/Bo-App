//
//  AppTabView.swift
//  Bo
//
//  Created by Kazim Ahmad on 18/04/2026.
//

import Combine
import SwiftUI

enum AppTab: String, Hashable, CaseIterable {
    case home
    case profile
    case search
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        case .search:
            return "Search"
        }
    }
    
    var symbolImage: String {
        switch self {
        case .home:
            return Images.homeSystemImage
        case .profile:
            return Images.userSystemImage
        case .search:
            return Images.searchSystemImage
        }
    }
    
    var role: TabRole? {
        switch self {
        case .search:
            return .search
        default:
            return nil
        }
    }
}


struct AppTabView: View {
    @State private var isPresented: Bool = false
    let flyingTime = Timer.publish(every: Constants.flyingBojackTime,
                                   on: .main,
                                   in: .common).autoconnect()

    var body: some View {
        TabView {
            ForEach(AppTab.allCases, id: \.rawValue) { tab in
                Tab(tab.title,
                    systemImage: tab.symbolImage,
                    role: tab.role) {
                    tabView(for: tab)
                }
            }
        }
        .fullScreenCover(isPresented: $isPresented) {
            FlyingBojack(isActive: $isPresented)
                .background(
                    ClearBackgroundView()
                )
        }
        .transaction({ transaction in
            transaction.disablesAnimations = true
        })
        .onReceive(flyingTime) { time in
            isPresented = true
        }
    }
    
    @ViewBuilder
    func tabView(for tab: AppTab) -> some View {
        switch tab {
        case .home:
            HomeView()
                .tag(tab)
        case .profile:
            ProfileView(viewModel: ProfileViewModel())
                .tag(tab)
        case .search:
            Text(tab.title)
                .tag(tab)
        }
    }
}

#Preview {
    AppTabView()
}
