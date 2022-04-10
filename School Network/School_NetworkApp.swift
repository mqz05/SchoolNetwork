//
//  School_NetworkApp.swift
//  School Network
//
//  Created by Mu qi Zhang on 1/1/22.
//

import SwiftUI

@main
struct School_NetworkApp: App {
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                
                // iPhone Frame:
                HomeView()
                
                /*Rectangle()
                    .frame(width: 390, height: 844)
                    .foregroundColor(.clear)
                    .border(Color.red, width: 2)*/
                
            }
            
        }
    }
}


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   //static let screenSize = UIScreen.main.bounds.size
}

