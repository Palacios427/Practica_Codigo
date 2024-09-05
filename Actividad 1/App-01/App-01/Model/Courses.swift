//
//  Courses.swift
//  app-01
//
//  Created by Jorge on 07/08/24.
//

import SwiftUI

@Observable class Courses: ObservableObject {
    
    var courses: [Course] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        let calendar = Calendar.current

        // Course 1: "Desarrollo de aplicaciones móviles"
        let startDate1 = calendar.date(from: DateComponents(year: 2024, month: 8, day: 10))!
        let endDate1 = calendar.date(from: DateComponents(year: 2024, month: 8, day: 30))!
        let startTime1 = calendar.date(from: DateComponents(hour: 11, minute: 0))!
        let endTime1 = calendar.date(from: DateComponents(hour: 15, minute: 0))!

        courses.append(
            Course(course: "TC2007B", name: "Desarrollo de aplicaciones móviles", semester: 5, days: [.monday, .wednesday, .friday], startDate: startDate1, endDate: endDate1, startTime: startTime1, endTime: endTime1)
        )
        
        // Course 2: "Algoritmos Avanzados"
        let startDate2 = calendar.date(from: DateComponents(year: 2024, month: 8, day: 15))!
        let endDate2 = calendar.date(from: DateComponents(year: 2024, month: 12, day: 10))!
        let startTime2 = calendar.date(from: DateComponents(hour: 9, minute: 0))!
        let endTime2 = calendar.date(from: DateComponents(hour: 12, minute: 0))!

        courses.append(
            Course(course: "TC2038", name: "Algoritmos Avanzados", semester: 5, days: [.tuesday, .thursday], startDate: startDate2, endDate: endDate2, startTime: startTime2, endTime: endTime2)
        )
    }
}
