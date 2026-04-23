//
//  DateManager.swift
//  Bo
//
//  Created by Kazim Ahmad on 22/04/2026.
//

import Foundation

class DateFactory {
    static let manager: DateFactory = DateFactory()
    
    func provideString(for date: Date) -> String {
        if isToday(date) {
            return "Today"
        } else if isYesterday(date) {
            return "Yesterday"
        } else if isDayBeforeYesterDay(date) {
            return "2 days ago"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy"
            return formatter.string(from: date)
        }
    }
    
    func isToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date, inSameDayAs: Date())
    }
    
    func isYesterday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date, inSameDayAs: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
    }
    
    func isDayBeforeYesterDay(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date, inSameDayAs: Calendar.current.date(byAdding: .day, value: -2, to: Date())!)
    }
}

extension Date {
    var appString: String {
        return DateFactory.manager.provideString(for: self)
    }
}
