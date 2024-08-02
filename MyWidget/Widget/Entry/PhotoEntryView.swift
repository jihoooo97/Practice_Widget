//
//  PhotoEntryView.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/31/24.
//

import SwiftUI

struct PhotoEntryView : View {
    var entry: PhotoProvider.Entry
    
    var body: some View {
        Image(uiImage: entry.photo.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .widgetURL(URL(string: "widget://deeplink?url=\(entry.photo.url)".getPercentEncodedString))
    }
}
