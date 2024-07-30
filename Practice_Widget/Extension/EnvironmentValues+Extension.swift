//
//  EnvironmentValues+Extension.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/30/24.
//

import SwiftUI

extension EnvironmentValues {
    
    var deepLinkText: String {
        get { self[DeepLinkEnv.self] }
        set { self[DeepLinkEnv.self] = newValue }
    }
    
}
