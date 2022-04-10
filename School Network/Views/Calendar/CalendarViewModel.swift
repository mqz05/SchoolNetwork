//
//  CalendarViewModel.swift
//  School Network
//
//  Created by Mu qi Zhang on 4/3/22.
//

import SwiftUI

class CalendarViewModel: ObservableObject {
    
    @Published var currentSelectedMonth: Int = 0
    
    @Published var currentSelectedMonthYear: Date = Date()
    
    func resetDates() {
        self.currentSelectedMonth = 0
        self.currentSelectedMonthYear = Date()
    }

    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentSelectedMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    func extractMonthDates() -> [DateValueModel] {
        
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllMonthDates().compactMap { date -> DateValueModel in
            
            let day = calendar.component(.day, from: date)
            
            return DateValueModel(day: day, date: date)
        }
        
        let firstWeekday = (calendar.component(.weekday, from: days.first?.date ?? Date()) - calendar.firstWeekday + 7) % 7 + 1
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValueModel(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func isSameMonth() -> Bool {
        
        let calendar = Calendar.current
        
        guard let c = calendar.date(byAdding: .month, value: currentSelectedMonth, to: Date()) else {
            return false
        }
        
        return Calendar.current.isDate(c, equalTo: Date(), toGranularity: .month)
    }
    
    
}

