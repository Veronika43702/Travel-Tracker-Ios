//
//  Home.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.theme) private var theme

    var body: some View {
        VStack {
            Text("Home Screen")
                .font(theme.typography.titleLarge)
                .foregroundColor(AppColors.Light.primary)
        }
    }
}
