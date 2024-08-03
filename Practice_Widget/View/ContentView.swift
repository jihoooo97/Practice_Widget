//
//  ContentView.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/18/24.
//

import SwiftUI
import WidgetKit
import ActivityKit

struct ContentView: View {
    @Environment(\.deepLinkText) private var deepLinkText: String
    
    var body: some View {
        VStack {
            Text(deepLinkText)
            
            Button("Reload") {
                WidgetCenter.shared.reloadAllTimelines()
            }
            .buttonStyle(BorderedProminentButtonStyle())
            
            Button("Start LiveActivity") {
                guard ActivityAuthorizationInfo().areActivitiesEnabled else {
                    print("fail")
                    return
                }
                
                do {
                    let attributes = SimpleAttributes(name: "test")
                    let contentState = SimpleAttributes.ContentState(emoji: "🤩")
                    let activity = try Activity.request(
                        attributes: attributes,
                        content: .init(state: contentState, staleDate: nil)
                    )
                    
                    print(activity)
                } catch {
                    print(error.localizedDescription)
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
