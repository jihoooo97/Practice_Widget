//
//  Practice_WidgetApp.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/18/24.
//

import SwiftUI
import WidgetKit

@main
struct Practice_WidgetApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { _, newPhase in
            #if DEBUG
            switch newPhase {
            case .active:
                print("active")
            case .inactive:
                print("in active")
            case .background:
//                WidgetCenter.shared.reloadAllTimelines()
                print("background")
            @unknown default:
                print("unknown scene")
            }
            #endif
        }
    }
}
