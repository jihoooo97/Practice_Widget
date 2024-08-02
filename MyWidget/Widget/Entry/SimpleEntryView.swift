//
//  SimpleEntryView.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/25/24.
//

import SwiftUI

struct SimpleEntryView : View {
    var entry: SimpleProvider.Entry

    var body: some View {
        VStack {
            Text(entry.meowFact)
            
            Text(entry.date.formatted(.dateTime))
                .font(.caption)
        }
        .widgetURL(URL(string: "widget://deeplink?meowFact=\(entry.meowFact)".getPercentEncodedString))
    }

}
