//
//  AppTheme.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI

// MARK: - Color Palette

struct AppColors {
    // Light
    struct Light {
        static let primary = Color(hex: 0x0EA5E9)
        static let onPrimary = Color.white
        static let primaryContainer = Color(hex: 0xE0F2FE)
        static let onPrimaryContainer = Color(hex: 0x001E2F)

        static let secondary = Color(hex: 0x10B981)
        static let onSecondary = Color.white
        static let secondaryContainer = Color(hex: 0xD1FAE5)
        static let onSecondaryContainer = Color(hex: 0x002114)

        static let tertiary = Color(hex: 0xF59E0B)
        static let onTertiary = Color.white
        static let tertiaryContainer = Color(hex: 0xFEF3C7)
        static let onTertiaryContainer = Color(hex: 0x2D1B00)

        static let error = Color(hex: 0xEF4444)
        static let onError = Color.white
        static let errorContainer = Color(hex: 0xFEE2E2)
        static let onErrorContainer = Color(hex: 0x410002)

        static let background = Color(hex: 0xFAFAFA)
        static let onBackground = Color(hex: 0x1E293B)
        static let surface = Color.white
        static let onSurface = Color(hex: 0x1E293B)
        static let surfaceVariant = Color(hex: 0xF1F5F9)
        static let onSurfaceVariant = Color(hex: 0x475569)

        static let outline = Color(hex: 0xCBD5E1)
        static let outlineVariant = Color(hex: 0xE2E8F0)

        // Custom
        static let visaCalendar = Color(hex: 0xFFE100)
        static let successGreen = Color(hex: 0x10B981)
        static let warningAmber = Color(hex: 0xF59E0B)
        static let dangerRed = Color(hex: 0xEF4444)
        static let infoBlue = Color(hex: 0x0EA5E9)

        static let textBright = Color.black
        static let textPrimary = Color(hex: 0x1E293B)
        static let textSecondary = Color(hex: 0x64748B)
        static let textDisabled = Color(hex: 0x94A3B8)
    }

    // Dark
    struct Dark {
        static let primary = Color(hex: 0x38BDF8)
        static let onPrimary = Color(hex: 0x001E2F)
        static let primaryContainer = Color(hex: 0x075985)
        static let onPrimaryContainer = Color(hex: 0xE0F2FE)

        static let secondary = Color(hex: 0x34D399)
        static let onSecondary = Color(hex: 0x002114)
        static let secondaryContainer = Color(hex: 0x047857)
        static let onSecondaryContainer = Color(hex: 0xD1FAE5)

        static let tertiary = Color(hex: 0xFBBF24)
        static let onTertiary = Color(hex: 0x2D1B00)
        static let tertiaryContainer = Color(hex: 0xB45309)
        static let onTertiaryContainer = Color(hex: 0xFEF3C7)

        static let error = Color(hex: 0xF87171)
        static let onError = Color(hex: 0x410002)
        static let errorContainer = Color(hex: 0x991B1B)
        static let onErrorContainer = Color(hex: 0xFEE2E2)

        static let background = Color(hex: 0x0F172A)
        static let onBackground = Color(hex: 0xF1F5F9)
        static let surface = Color(hex: 0x1E293B)
        static let onSurface = Color(hex: 0xF1F5F9)
        static let surfaceVariant = Color(hex: 0x334155)
        static let onSurfaceVariant = Color(hex: 0xCBD5E1)

        static let outline = Color(hex: 0x64748B)
        static let outlineVariant = Color(hex: 0x475569)

        // Custom
        static let visaCalendar = Color(hex: 0xFFE100)
        static let successGreen = Color(hex: 0x10B981)
        static let warningAmber = Color(hex: 0xF59E0B)
        static let dangerRed = Color(hex: 0xEF4444)
        static let infoBlue = Color(hex: 0x0EA5E9)

        static let textBright = Color.white
        static let textPrimary = Color(hex: 0xF1F5F9)
        static let textSecondary = Color(hex: 0x94A3B8)
        static let textDisabled = Color(hex: 0x64748B)
    }
}

// MARK: - Typography

struct AppTypography {
    let displayLarge = Font.system(size: 57, weight: .regular)
    let displayMedium = Font.system(size: 45, weight: .regular)
    let displaySmall = Font.system(size: 36, weight: .regular)

    let headlineLarge = Font.system(size: 32, weight: .regular)
    let headlineMedium = Font.system(size: 28, weight: .regular)
    let headlineSmall = Font.system(size: 20, weight: .medium)

    let titleLarge = Font.system(size: 20, weight: .semibold)
    let titleMedium = Font.system(size: 16, weight: .semibold)
    let titleSmall = Font.system(size: 16, weight: .medium)

    let bodyLarge = Font.system(size: 18, weight: .light)
    let bodyMedium = Font.system(size: 14, weight: .regular)
    let bodySmall = Font.system(size: 14, weight: .regular)

    let labelLarge = Font.system(size: 14, weight: .medium)
    let labelMedium = Font.system(size: 12, weight: .medium)
    let labelSmall = Font.system(size: 11, weight: .regular)

    let calendarDay = Font.system(size: 19, weight: .ultraLight)
}

// MARK: - Environment keys

struct Theme {
    let colors: AppColors.Type
    let typography = AppTypography()
}

private struct ThemeKey: EnvironmentKey {
    static let defaultValue = Theme(colors: AppColors.self)
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

// MARK: - Theme Provider

struct AppTheme: ViewModifier {
    @Environment(\.colorScheme) private var systemScheme

    func body(content: Content) -> some View {
        content.environment(\.theme, theme)
    }

    private var theme: Theme {
        systemScheme == .dark
            ? Theme(colors: AppColors.self) // Dark палитра
            : Theme(colors: AppColors.self) // Light палитра
    }
}

extension View {
    func appTheme() -> some View {
        modifier(AppTheme())
    }
}

// MARK: - Helpers

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}
