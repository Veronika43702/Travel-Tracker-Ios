//
//  AppTheme.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI

// MARK: - Color Palette
protocol AppColorsProtocol {
    // Core colors
    var primary: Color { get }
    var onPrimary: Color { get }
    var primaryContainer: Color { get }
    var onPrimaryContainer: Color { get }
    
    var secondary: Color { get }
    var onSecondary: Color { get }
    var secondaryContainer: Color { get }
    var onSecondaryContainer: Color { get }
    
    var tertiary: Color { get }
    var onTertiary: Color { get }
    var tertiaryContainer: Color { get }
    var onTertiaryContainer: Color { get }
    
    var error: Color { get }
    var onError: Color { get }
    var errorContainer: Color { get }
    var onErrorContainer: Color { get }
    
    var background: Color { get }
    var onBackground: Color { get }
    var surface: Color { get }
    var onSurface: Color { get }
    var surfaceVariant: Color { get }
    var onSurfaceVariant: Color { get }
    
    var outline: Color { get }
    var outlineVariant: Color { get }
    
    // Custom colors
    var visaCalendar: Color { get }
    var successGreen: Color { get }
    var warningAmber: Color { get }
    var dangerRed: Color { get }
    var infoBlue: Color { get }
    
    var textBright: Color { get }
    var textPrimary: Color { get }
    var textSecondary: Color { get }
    var textDisabled: Color { get }
}

struct AppColors {
    struct Light: AppColorsProtocol {
        let primary = Color(hex: 0x0EA5E9)
        let onPrimary = Color.white
        let primaryContainer = Color(hex: 0xE0F2FE)
        let onPrimaryContainer = Color(hex: 0x001E2F)
        
        let secondary = Color(hex: 0x10B981)
        let onSecondary = Color.white
        let secondaryContainer = Color(hex: 0xD1FAE5)
        let onSecondaryContainer = Color(hex: 0x002114)
        
        let tertiary = Color(hex: 0xF59E0B)
        let onTertiary = Color.white
        let tertiaryContainer = Color(hex: 0xFEF3C7)
        let onTertiaryContainer = Color(hex: 0x2D1B00)
        
        let error = Color(hex: 0xEF4444)
        let onError = Color.white
        let errorContainer = Color(hex: 0xFEE2E2)
        let onErrorContainer = Color(hex: 0x410002)
        
        let background = Color(hex: 0xFAFAFA)
        let onBackground = Color(hex: 0x1E293B)
        let surface = Color.white
        let onSurface = Color(hex: 0x1E293B)
        let surfaceVariant = Color(hex: 0xF1F5F9)
        let onSurfaceVariant = Color(hex: 0x475569)
        
        let outline = Color(hex: 0xCBD5E1)
        let outlineVariant = Color(hex: 0xE2E8F0)
        
        // Custom
        let visaCalendar = Color(hex: 0xFFE100)
        let successGreen = Color(hex: 0x10B981)
        let warningAmber = Color(hex: 0xF59E0B)
        let dangerRed = Color(hex: 0xEF4444)
        let infoBlue = Color(hex: 0x0EA5E9)
        
        let textBright = Color.black
        let textPrimary = Color(hex: 0x1E293B)
        let textSecondary = Color(hex: 0x64748B)
        let textDisabled = Color(hex: 0x94A3B8)
        
        init() {}
    }
    
    struct Dark: AppColorsProtocol {
        let primary = Color(hex: 0x38BDF8)
        let onPrimary = Color(hex: 0x001E2F)
        let primaryContainer = Color(hex: 0x075985)
        let onPrimaryContainer = Color(hex: 0xE0F2FE)
        
        let secondary = Color(hex: 0x34D399)
        let onSecondary = Color(hex: 0x002114)
        let secondaryContainer = Color(hex: 0x047857)
        let onSecondaryContainer = Color(hex: 0xD1FAE5)
        
        let tertiary = Color(hex: 0xFBBF24)
        let onTertiary = Color(hex: 0x2D1B00)
        let tertiaryContainer = Color(hex: 0xB45309)
        let onTertiaryContainer = Color(hex: 0xFEF3C7)
        
        let error = Color(hex: 0xF87171)
        let onError = Color(hex: 0x410002)
        let errorContainer = Color(hex: 0x991B1B)
        let onErrorContainer = Color(hex: 0xFEE2E2)
        
        let background = Color(hex: 0x0F172A)
        let onBackground = Color(hex: 0xF1F5F9)
        let surface = Color(hex: 0x1E293B)
        let onSurface = Color(hex: 0xF1F5F9)
        let surfaceVariant = Color(hex: 0x334155)
        let onSurfaceVariant = Color(hex: 0xCBD5E1)
        
        let outline = Color(hex: 0x64748B)
        let outlineVariant = Color(hex: 0x475569)
        
        // Custom
        let visaCalendar = Color(hex: 0xFFE100)
        let successGreen = Color(hex: 0x10B981)
        let warningAmber = Color(hex: 0xF59E0B)
        let dangerRed = Color(hex: 0xEF4444)
        let infoBlue = Color(hex: 0x0EA5E9)
        
        let textBright = Color.white
        let textPrimary = Color(hex: 0xF1F5F9)
        let textSecondary = Color(hex: 0x94A3B8)
        let textDisabled = Color(hex: 0x64748B)
        
        init() {}
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
    let colors: AppColorsProtocol
    let typography = AppTypography()
}

private struct ThemeKey: EnvironmentKey {
    static let defaultValue: Theme = Theme(colors: AppColors.Light())
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
    @ObservedObject var themeManager: ThemeManager
    
    func body(content: Content) -> some View {
        content.environment(\.theme, resolvedTheme)
    }
    
    private var resolvedTheme: Theme {
        switch themeManager.currentTheme {
        case .system:
            return systemScheme == .dark ? Theme(colors: AppColors.Dark()) : Theme(colors: AppColors.Light())
        case .light:
            return Theme(colors: AppColors.Light())
        case .dark:
            return Theme(colors: AppColors.Dark())
        }
    }
}

extension View {
    func appTheme(themeManager: ThemeManager) -> some View {
        modifier(AppTheme(themeManager: themeManager))
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

@MainActor
class ThemeManager: ObservableObject {
    @AppStorage("selectedTheme") private var storedTheme: String = AppThemeModel.system.rawValue
    @Published var currentTheme: AppThemeModel = .system
    
    init() {
        loadTheme()
    }
    
    func loadTheme() {
        currentTheme = AppThemeModel(rawValue: storedTheme) ?? .system
    }
    
    func updateTheme(_ theme: AppThemeModel) {
        currentTheme = theme
        storedTheme = theme.rawValue
    }
}

