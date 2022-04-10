//
//  DateExtension.swift
//  School Network
//
//  Created by Mu qi Zhang on 8/3/22.
//

import SwiftUI


extension Date {
    
    func getAllMonthDates() -> [Date] {
        
        let calendar = Calendar.current
        
        // Adding time interval depending on the time zone
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!.getGmtDate()
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
    
    func getGmtDate() -> Date {
        
        let year = Calendar.current.dateComponents([.year], from: self).year!
        let month = Calendar.current.dateComponents([.month], from: self).month!
        let day = Calendar.current.dateComponents([.day], from: self).day!
        
        let dayComponents = "\(day)-\(month)-\(year) 00:00:00"
        
        var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d-MM-yyyy HH:mm:ss"
            dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
            return dateFormatter
        }
        
        return dateFormatter.date(from: dayComponents)!
    }
}
