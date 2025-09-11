//
//  SettingContract.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI
import Combine

enum AppThemeModel: String, CaseIterable, Identifiable {
    case system
    case light
    case dark

    var id: String { self.rawValue }

    var displayName: String {
        switch self {
        case .system: return NSLocalizedString("settings_theme_system", comment: "")
        case .light: return NSLocalizedString("settings_theme_light", comment: "")
        case .dark: return NSLocalizedString("settings_theme_dark", comment: "")
        }
    }
}

enum AppDateFormatModel: String, CaseIterable {
    case ddMMyyyyDots
    case ddMMyyyySlashes
    case mmddyyyy
    case yyyymmdd
    case ddMMMyyyy
    
    static func getDefault() -> AppDateFormatModel {
        return .ddMMyyyyDots
    }
}

class SettingsState: ObservableObject {
    @Published var language: String? = nil
    @Published var selectedLanguageInDialog: String? = nil
    
    @Published var selectedThemeInDialog: AppThemeModel = .system
    @Published var selectedDateFormatInDialog: AppDateFormatModel = AppDateFormatModel.getDefault()
    
    @Published var appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    @Published var error: String? = nil
    
}
