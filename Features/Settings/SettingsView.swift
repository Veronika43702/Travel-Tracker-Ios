//
//  SettingsView.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.theme) private var theme
    @StateObject private var viewModel: SettingsViewModel
    
    init(themeManager: ThemeManager) {
          _viewModel = StateObject(wrappedValue: SettingsViewModel(themeManager: themeManager))
      }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    // General
                    SettingsSectionView(title: NSLocalizedString("settings_category_general", comment: "")) {
                        SettingsItemView(
                            iconName: "globe",
                            title: NSLocalizedString("settings_language_title", comment: ""),
                            currentValue: getCurrentLanguageText(),
                            action: {
                                openAppSettings()
                            }
                        )
                    }
                    
                    // Appearance
                    SettingsSectionView(title: NSLocalizedString("settings_category_appearance", comment: "")) {
                        VStack(spacing: 1) {
                            SettingsItemView(
                                iconName: "paintpalette",
                                title: NSLocalizedString("settings_theme_title", comment: ""),
                                currentValue: viewModel.state.selectedThemeInDialog.displayName,
                                action: { viewModel.showThemeDialog() }
                            )
                            
                            SettingsItemView(
                                iconName: "calendar",
                                title: NSLocalizedString("settings_date_format_title", comment: ""),
                                currentValue: getCurrentDateFormatText(),
                                action: { print("Show date format selection") }
                            )
                        }
                    }
                    
                    // About
                    SettingsSectionView(title: NSLocalizedString("settings_category_about", comment: "")) {
                        SettingsItemView(
                            iconName: "info.circle",
                            title: NSLocalizedString("settings_app_version", comment: ""),
                            currentValue: viewModel.state.appVersion,
                            action: nil
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Settings")
            .background(theme.colors.background)
            
    
            if viewModel.isThemeDialogPresented {
                Color.black.opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        viewModel.dismissThemeDialog()
                    }
                
                ThemeSelectionDialog(viewModel: viewModel)
                    .frame(maxWidth: 400)
                    .background(theme.colors.background)
                    .cornerRadius(16)
                    .shadow(radius: 20)
                    .padding()
            }
        }
    }
    
    func getCurrentLanguageText() -> String {
        switch viewModel.state.selectedLanguageInDialog {
        case "ru":
            return NSLocalizedString("settings_language_russian", comment: "")
        case "en":
            return NSLocalizedString("settings_language_english", comment: "")
        default:
            return NSLocalizedString("settings_language_system", comment: "")
        }
    }
    
    func getCurrentDateFormatText() -> String {
        switch viewModel.state.selectedDateFormatInDialog {
        case .ddMMyyyyDots: return NSLocalizedString("settings_date_format_dd_mm_yyyy_dots", comment: "")
        case .ddMMyyyySlashes: return NSLocalizedString("settings_date_format_dd_mm_yyyy_slashes", comment: "")
        case .mmddyyyy: return NSLocalizedString("settings_date_format_mm_dd_yyyy", comment: "")
        case .yyyymmdd: return NSLocalizedString("settings_date_format_yyyy_mm_dd", comment: "")
        case .ddMMMyyyy: return NSLocalizedString("settings_date_format_dd_mmm_yyyy", comment: "")
        }
    }
    
    func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
