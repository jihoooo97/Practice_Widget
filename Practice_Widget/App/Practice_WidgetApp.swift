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
    @State private var urlString: String = ""
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.deepLinkText, urlString)
                .onOpenURL(perform: { url in
                    urlString = url.absoluteString.removingPercentEncoding ?? ""
                })
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


struct DeepLinkEnv: EnvironmentKey {
    static let defaultValue = ""
}
