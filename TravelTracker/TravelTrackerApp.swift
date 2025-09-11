//
//  TravelTrackerApp.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI

@main
struct MyAppApp: App {
    @StateObject private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .appTheme(themeManager: themeManager)
                .environmentObject(themeManager)
        }
    }
}
