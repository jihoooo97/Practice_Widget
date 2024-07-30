//
//  ContentView.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/18/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @Environment(\.deepLinkText) private var deepLinkText: String
    
    var body: some View {
        VStack {
            Text(deepLinkText)
            
            Button("Reload") {
                WidgetCenter.shared.reloadAllTimelines()
            }
            .buttonStyle(BorderedProminentButtonStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
