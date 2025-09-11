//
//  SettingsViewModel.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import Foundation
import SwiftUI

@MainActor
class SettingsViewModel: ObservableObject {
    @Published var state = SettingsState()
    
    private let themeManager: ThemeManager
    
    // MARK: - Storage (AppStorage = UserDefaults)
    @AppStorage("selectedTheme") private var storedTheme: String = AppThemeModel.system.rawValue
    @AppStorage("selectedDateFormat") private var storedDateFormat: String = AppDateFormatModel.getDefault().rawValue
    
    // MARK: - Dialog flags
    @Published var isThemeDialogPresented: Bool = false
    @Published var isLanguageDialogPresented: Bool = false
    @Published var isDateFormatDialogPresented: Bool = false
    
    // MARK: - Init
    init(themeManager: ThemeManager) {
        self.themeManager = themeManager
        loadData()
    }
    
    // MARK: - Load initial data
    func loadData() {
        // Language
        if #available(iOS 16.0, *) {
            if let langCode = Locale.current.language.languageCode {
                state.language = langCode.identifier
            } else {
                state.language = "en"
            }
        } else {
            state.language = Locale.current.languageCode ?? "en"
        }
        
        // Restore saved language
        state.selectedLanguageInDialog = state.language
        
        if let savedTheme = AppThemeModel(rawValue: UserDefaults.standard.string(forKey: "selectedTheme") ?? "system") {
                   state.selectedThemeInDialog = savedTheme
               } else {
                   state.selectedThemeInDialog = .system
               }
        
        // Restore saved theme
        state.selectedThemeInDialog = AppThemeModel(rawValue: storedTheme) ?? .system
        
        // Restore saved date format
        state.selectedDateFormatInDialog = AppDateFormatModel(rawValue: storedDateFormat) ?? AppDateFormatModel.getDefault()
        
        // App version
        state.appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    // MARK: - Theme
    func showThemeDialog() {
        isThemeDialogPresented = true
    }
    
    func selectTheme(_ theme: AppThemeModel) {
        state.selectedThemeInDialog = theme
        themeManager.updateTheme(theme)
    }
    
    func dismissThemeDialog() {
        isThemeDialogPresented = false
    }
    
    // MARK: - Date format
    func showDateFormatDialog() {
        isDateFormatDialogPresented = true
    }
    
    func selectDateFormat(_ format: AppDateFormatModel) {
        state.selectedDateFormatInDialog = format
        storedDateFormat = format.rawValue
    }
    
    func dismissDateFormatDialog() {
        isDateFormatDialogPresented = false
    }
}
