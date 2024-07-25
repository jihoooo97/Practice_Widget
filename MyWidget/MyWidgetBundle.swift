//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by 유지호 on 7/18/24.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        MyWidgetLiveActivity()
    }
}
