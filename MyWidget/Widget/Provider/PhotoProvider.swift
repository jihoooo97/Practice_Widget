//
//  PhotoProvider.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/31/24.
//

import SwiftUI
import WidgetKit

struct PhotoProvider: TimelineProvider {
    func placeholder(in context: Context) -> PhotoEntry {
        PhotoEntry(date: .now, photo: .init(url: "", image: .init()))
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        getPhoto { photo in
            completion(PhotoEntry(date: .now, photo: photo))
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<PhotoEntry>) -> Void) {
        getPhoto { photo in
            let currentDate = Date()
            let nextDate = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate)!
            let entry = PhotoEntry(date: currentDate, photo: photo)
            let nextEntry = PhotoEntry(date: nextDate, photo: photo)
            
            completion(Timeline(entries: [entry, nextEntry], policy: .atEnd))
        }
    }
}

private extension PhotoProvider {
    
    func getPhoto(_ completion: @escaping (Photo) -> ()) {
        guard let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?tags=texas&tagmode=any&format=json&nojsoncallback=1")
        else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,
                  let photoEntity = try? JSONDecoder().decode(PhotoEntity.self, from: data),
                  let urlString = photoEntity.items.first?.media.m
            else { return }
            
            if let image = ImageCache.shared.object(forKey: urlString as NSString) {
                completion(Photo(url: urlString, image: image))
            } else {
                guard let url = URL(string: urlString),
                      let data = try? Data(contentsOf: url),
                      let image = UIImage(data: data)
                else { return }
                
                ImageCache.shared.setObject(image, forKey: urlString as NSString)
                completion(Photo(url: urlString, image: image))
            }
        }
        .resume()
    }
    
}
