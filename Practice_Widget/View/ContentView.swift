//
//  ContentView.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/18/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @State private var placeholder = "Hello,"
    
    var body: some View {
        VStack {
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
