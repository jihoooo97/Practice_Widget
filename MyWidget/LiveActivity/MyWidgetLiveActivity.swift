//
//  MyWidgetLiveActivity.swift
//  MyWidget
//
//  Created by 유지호 on 7/18/24.
//

import SwiftUI
import WidgetKit
import ActivityKit

struct MyWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SimpleAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("왼쪽")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("오른쪽")
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("가운데")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("아래 \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

#Preview("Notification", as: .content, using: SimpleAttributes.preview) {
    MyWidgetLiveActivity()
} contentStates: {
    SimpleAttributes.ContentState.smiley
    SimpleAttributes.ContentState.starEyes
}
