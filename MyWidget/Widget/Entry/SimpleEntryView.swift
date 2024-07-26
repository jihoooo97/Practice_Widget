//
//  SimpleEntryView.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/25/24.
//

import SwiftUI
import WidgetKit

struct SimpleEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Favorite Emoji:")
            Text(entry.configuration.favoriteEmoji)
        }
    }
}
