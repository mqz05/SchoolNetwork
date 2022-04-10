//
//  CalendarView.swift
//  School Network
//
//  Created by Mu qi Zhang on 4/3/22.
//

import SwiftUI

struct CalendarView: View {
    
    //@State var isShowingCalendar = true
    
    @StateObject var calendarViewModel = CalendarViewModel()
    
    // Time Data
    @State var currentSelectedFullDate = Date()
    
    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea()
            
        ScrollView(.vertical, showsIndicators: false) {
            
            
            
            
            /*Rectangle()
             //.frame(width: 760, height: 760).cornerRadius(35)
             .foregroundColor(Color.secondaryDarkBlue1)
             .ignoresSafeArea()*/
            
            VStack(spacing: 20) {
                
                Rectangle()
                    .frame(height: screenHeight * 0.05)
                    .hidden()
                
                // MonthSelectopr
                MonthSelector()
                    .onChange(of: calendarViewModel.currentSelectedMonth, perform: { newValue in
                        withAnimation(.linear(duration: 0.5)) {
                            calendarViewModel.currentSelectedMonthYear = calendarViewModel.getCurrentMonth()
                        }
                    })
                
                
                // Weekdays
                HStack(spacing: 0) {
                    ForEach(weekDays, id: \.self, content: { day in
                        
                        Text(day)
                        //.font(.custom("NewAcademy", size: 30))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        //.foregroundColor(Color.primaryLightBlue2)
                    })
                }.padding(.horizontal, 10)
                
                
                
                // Day Selector
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    
                    ForEach(calendarViewModel.extractMonthDates()) { value in
                        
                        DayCard(value: value)
                            .background(
                                
                                Capsule()
                                    .fill(Color.purple)
                                    .padding(.horizontal, 3)
                                    .opacity(calendarViewModel.isSameDay(date1: value.date, date2: currentSelectedFullDate) ? 1 : 0)
                            )
                            .onTapGesture {
                                currentSelectedFullDate = value.date
                            }
                    }
                }.padding(.horizontal)
                
                
                // Day Reminders
                VStack(spacing: 15) {
                    
                    Text("Reminders")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 20)
                    
                    if let reminder = remindersExamples.first(where: { reminder in
                        return calendarViewModel.isSameDay(date1: reminder.reminderDate, date2: currentSelectedFullDate)
                    }) {
                        ForEach(reminder.reminders) { reminder in
                            VStack(alignment: .leading, spacing: 10) {
                                Text(reminder.date
                                        .addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                                
                                Text(reminder.title)
                                    .font(.title2.bold())
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                Color.secondaryBlue
                                    .opacity(0.7)
                                    .cornerRadius(10)
                            )
                        }
                    } else {
                        Text("No Reminder Found")
                    }
                }.padding()
                
                
                // Add Reminder
            }
        }
        }
    }
    
    func calendarDateFormatter() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: calendarViewModel.currentSelectedMonthYear)
        
        return date.components(separatedBy: " ")
    }
    
    @ViewBuilder
    func MonthSelector() -> some View {
        
        // Month Selector
        HStack(spacing: 20) {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(calendarDateFormatter()[0])
                //.font(.custom("", size: 32, relativeTo: .title3))
                    .font(.title3)
                    .foregroundColor(Color.primaryDarkBlue)
                
                
                Text(calendarDateFormatter()[1])
                //.font(.custom("", size: 60, relativeTo: .largeTitle))
                    .font(.largeTitle.bold())
                    .foregroundColor(Color.primaryDarkBlue)
            }
            
            Spacer(minLength: 0)
            
            
            Button(action: {
                withAnimation(.spring()) {
                    calendarViewModel.currentSelectedMonth -= 1
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(Color.primaryDarkBlue)
            })
            
            Button(action: {
                withAnimation(.spring()) {
                    calendarViewModel.currentSelectedMonth += 1
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(Color.primaryDarkBlue)
            })
            
            //.padding(.trailing, 30).scaleEffect(1.8)
            
        }.padding(.horizontal)
        
    }
    
    @ViewBuilder
    func DayCard(value: DateValueModel) -> some View {
        
        
        VStack {
            if value.day != -1 {
                
                if let reminder = remindersExamples.first(where: { reminder in
                    return calendarViewModel.isSameDay(date1: reminder.reminderDate, date2: value.date)
                }) {
                    
                    Text("\(value.day)")
                    //.font(.custom("DaggerSquare", size: 26))
                        .font(.title3.bold())
                        .foregroundColor(calendarViewModel.isSameDay(date1: value.date, date2: currentSelectedFullDate) ? Color.white : Color.primaryBlue)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(calendarViewModel.isSameDay(date1: reminder.reminderDate, date2: currentSelectedFullDate) ? Color.white : Color.purpleMagenta)
                        .frame(width: screenWidth < 500 ? 8 : 12, height: screenWidth < 500 ? 8 : 12)
                    
                } else {
                    Text("\(value.day)")
                    //.font(.custom("DaggerSquare", size: 26))
                        .font(.title3.bold())
                        .foregroundColor(calendarViewModel.isSameDay(date1: value.date, date2: currentSelectedFullDate) ? Color.white : Color.primaryBlue)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                
                
            } /*else {
               //Text("-1").font(.title3.bold()).opacity(0)
               }*/
        }
        .padding(.vertical, 9)
        .frame(height: screenHeight * 0.071, alignment: .top)
        
        
        /*
         if value.day != -1 {
         Text("\(value.day)")
         //.font(.custom("DaggerSquare", size: 26))
         .font(.title3.bold())
         .foregroundColor(Color.primaryBlue)
         .background(
         calendarViewModel.isSameDay(date1: value.date, date2: calendarViewModel.currentSelectedMonthYear) && calendarViewModel.isSameMonth()
         
         ? Circle().foregroundColor(Color.purple)
         : nil )
         
         } else {
         Text("10").font(.title3.bold()).opacity(0)
         }*/
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
