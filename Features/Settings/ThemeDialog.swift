//
//  ThemeDialog.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI

struct ThemeSelectionDialog: View {
    @ObservedObject var viewModel: SettingsViewModel
    @State private var selectedTheme: AppThemeModel
    @Environment(\.theme) private var theme
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        _selectedTheme = State(initialValue: viewModel.state.selectedThemeInDialog)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text(NSLocalizedString("settings_theme_title", comment: ""))
                .font(.title2)
                .bold()
                .foregroundColor(theme.colors.onSurface)

            Text(NSLocalizedString("settings_theme_description", comment: ""))
                .font(.subheadline)
                .foregroundColor(theme.colors.onSurfaceVariant)

            VStack(spacing: 0) {
                ForEach(AppThemeModel.allCases) { themeOption in
                    HStack {
                        Image(systemName: selectedTheme == themeOption ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(selectedTheme == themeOption ? theme.colors.primary : theme.colors.onBackground)
                        Spacer()
                            .frame(width: 24)
                        Text(themeOption.displayName)
                            .foregroundColor(theme.colors.onBackground)
                        Spacer()
                    }
                    .padding()
                    .cornerRadius(8)
                    .onTapGesture { selectedTheme = themeOption }
                }
            }

            HStack {
                Button(NSLocalizedString("Cancel", comment: "")) {
                    viewModel.dismissThemeDialog()
                }
                .foregroundColor(theme.colors.primary)
                
                Spacer()
                
                Button(NSLocalizedString("Save", comment: "")) {
                    viewModel.selectTheme(selectedTheme)
                    viewModel.dismissThemeDialog()
                }
                .foregroundColor(theme.colors.onPrimary)
                .padding()
                .background(theme.colors.primary)
                .cornerRadius(8)
            }
            .padding()
        }
        .padding()
        .background(theme.colors.background)
        .cornerRadius(16)
        .shadow(radius: 20)
    }
}
