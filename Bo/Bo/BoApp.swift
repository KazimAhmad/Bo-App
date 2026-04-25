//
//  BoApp.swift
//  Bo
//
//  Created by Kazim Ahmad on 18/04/2026.
//

import SwiftUI
import SwiftData

@main
struct BoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(sharedModelContainer)
    }
}

struct MainView: View {
    var session: Session = Session.current

    var body: some View {
        if !session.isAuthenticating {
            NavigationStack {
                LoginView()                
            }
        } else {
            AppTabView()
        }
    }
}
