//
//  MyWidget.swift
//  MyWidget
//
//  Created by 유지호 on 7/18/24.
//

import WidgetKit
import SwiftUI

struct MyWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: PhotoProvider()
        ) { entry in
            PhotoEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall])
        
//        AppIntentConfiguration(
//            kind: kind,
//            intent: ConfigurationAppIntent.self,
//            provider: Provider()
//        ) { entry in
//            SimpleEntryView(entry: entry)
//        }
    }
}

#Preview(as: .systemMedium) {
    MyWidget()
} timeline: {
    SimpleEntry(date: .now, meowFact: "Empty")
}
