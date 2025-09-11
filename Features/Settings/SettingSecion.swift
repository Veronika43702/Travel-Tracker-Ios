//
//  SettingSecion.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI

struct SettingsSectionView<Content: View>: View {
    @Environment(\.theme) private var theme
    
    var title: String
    var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(theme.colors.primary)
                .padding(.horizontal)
            
            VStack(spacing: 1) {
                content()
            }
            .background(theme.colors.background)
            .cornerRadius(12)
            .padding(.horizontal)
        }
        .padding(.top, 16)
    }
}
