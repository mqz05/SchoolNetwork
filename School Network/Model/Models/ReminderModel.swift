//
//  ReminderModel.swift
//  School Network
//
//  Created by Mu qi Zhang on 4/3/22.
//

import SwiftUI

struct Reminder: Identifiable {
    var id = UUID().uuidString
    var title: String
    var date: Date = Date()
}

struct ReminderMetaData: Identifiable {
    var id = UUID().uuidString
    var reminders: [Reminder]
    var reminderDate: Date
}

func getSampleDate(offset: Int) -> Date {
    
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}


var remindersExamples: [ReminderMetaData] = [

    ReminderMetaData(reminders: [
        Reminder(title: "Recordatorio 1"),
        Reminder(title: "Recordatorio 2"),
        Reminder(title: "Recordatorio 3")
    ], reminderDate: getSampleDate(offset: 1)),
    
    ReminderMetaData(reminders: [
        Reminder(title: "Recordatorio 4"),
    ], reminderDate: getSampleDate(offset: -7)),
    
    ReminderMetaData(reminders: [
        Reminder(title: "Recordatorio 5"),
        Reminder(title: "Recordatorio 6")
    ], reminderDate: getSampleDate(offset: 5)),
    
    ReminderMetaData(reminders: [
        Reminder(title: "Recordatorio 7"),
        Reminder(title: "Recordatorio 8")
    ], reminderDate: getSampleDate(offset: 3)),
    
    ReminderMetaData(reminders: [
        Reminder(title: "Recordatorio 9")
    ], reminderDate: getSampleDate(offset: 10)),
    
    ReminderMetaData(reminders: [
        Reminder(title: "Recordatorio 10"),
        Reminder(title: "Recordatorio 11"),
        Reminder(title: "Recordatorio 12"),
        Reminder(title: "Recordatorio 13")
    ], reminderDate: getSampleDate(offset: -4))

]

