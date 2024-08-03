//
//  SimpleAttributes.swift
//  Practice_Widget
//
//  Created by 유지호 on 8/3/24.
//

import ActivityKit

struct SimpleAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }
    
    // Fixed non-changing properties about your activity go here!
    var name: String
}


extension SimpleAttributes {
    
    static var preview: SimpleAttributes {
        SimpleAttributes(name: "World")
    }
    
}

extension SimpleAttributes.ContentState {
    
    static var smiley: SimpleAttributes.ContentState {
        SimpleAttributes.ContentState(emoji: "😀")
    }
    
    static var starEyes: SimpleAttributes.ContentState {
        SimpleAttributes.ContentState(emoji: "🤩")
    }
    
}
