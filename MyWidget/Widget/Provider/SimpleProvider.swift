//
//  SimpleProvider.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/25/24.
//

import WidgetKit

struct SimpleProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), meowFact: "Empty")
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        let meowFact = await getMeowFact()
        return SimpleEntry(date: Date(), meowFact: meowFact)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        
        for minOffset in 0..<5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minOffset * 5, to: currentDate)!
            let meowFact = await getMeowFact()
            let entry = SimpleEntry(date: entryDate, meowFact: meowFact)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    private func getMeowFact() async -> String {
        guard let url = URL(string: "https://meowfacts.herokuapp.com/?count=1") else { return "Invalid URL String" }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let fact = try JSONDecoder().decode(FactModel.self, from: data)
            
            return fact.data[0]
        } catch {
            return error.localizedDescription
        }
    }
}
