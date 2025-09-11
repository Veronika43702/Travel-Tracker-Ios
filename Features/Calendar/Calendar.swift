//
//  Calendar.swift
//  TravelTracker
//
//  Created by Veronika Firsova on 11.09.2025.
//

import SwiftUI

struct CalendarView: View {
    @Environment(\.theme) private var theme
    
    var body: some View {
        VStack {
            Text("Calendar Screen")
                .font(theme.typography.titleLarge)
                .foregroundColor(AppColors.Light.primary)
        }
    }
}
