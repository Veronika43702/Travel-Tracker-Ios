//
//  SettingsItem.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI

struct SettingsItemView: View {
    @Environment(\.theme) private var theme
    
    var iconName: String
    var title: String
    var currentValue: String
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            HStack {
                Image(systemName: iconName)
                    .frame(width: 24, height: 24)
                    .foregroundColor(theme.colors.onSurfaceVariant)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(theme.colors.onSurface)
                    Text(currentValue)
                        .font(.subheadline)
                        .foregroundColor(theme.colors.onSurfaceVariant)
                }
                
                Spacer()
                
                if action != nil {
                    Image(systemName: "chevron.right")
                        .foregroundColor(theme.colors.onSurfaceVariant)
                }
            }
            .padding()
            .background(theme.colors.surface)
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
