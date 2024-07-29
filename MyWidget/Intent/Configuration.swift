//
//  AppIntent.swift
//  MyWidget
//
//  Created by 유지호 on 7/18/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Meow Fact", default: "empty")
    var meowFact: String
}


extension ConfigurationAppIntent {
    
    static var empty: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.meowFact = "empty"
        return intent
    }
    
}
