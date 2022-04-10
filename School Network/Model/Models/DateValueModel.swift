//
//  DateValueModel.swift
//  School Network
//
//  Created by Mu qi Zhang on 4/3/22.
//

import SwiftUI

struct DateValueModel: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

let weekDays: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
