//
//  MenuModel.swift
//  School Network
//
//  Created by Mu qi Zhang on 14/3/22.
//

import SwiftUI


//
// MARK: Modos del Menu (Modelo)
//

enum MenuModesData: CaseIterable {
    case home
    case messages
    case calendar
    case news
    case marketplace
    case classroom
    case profile
    case account
    case settings
    
    var sectionName: String {
        switch self {
        case .home: return "Home"
        case .messages: return "Messages"
        case .calendar: return "Calendar"
        case .news: return "News"
        case .marketplace: return "Marketplace"
        case .classroom: return "Classroom"
        case .profile: return "Profile"
        case .account: return "Account"
        case .settings: return "Settings"
        }
    }
    
    var view: AnyView {
        switch self {
        case .home: return AnyView(MainHome())
        case .messages: return AnyView(MessagesView())
        case .calendar: return AnyView(CalendarView())
        case .news: return AnyView(Color.red.ignoresSafeArea())
        case .marketplace: return AnyView(Color.yellow.ignoresSafeArea())
        case .classroom: return AnyView(Color.blue.ignoresSafeArea())
        case .profile: return AnyView(Color.purple.ignoresSafeArea())
        case .account: return AnyView(AccountView())
        case .settings: return AnyView(Color.gray.ignoresSafeArea())
        }
    }
}
