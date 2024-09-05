//
//  Course.swift
//  app-01
//
//  Created by Jorge on 07/08/24.
//

import SwiftUI


struct Course: Identifiable, Hashable {
    
    var id: UUID = UUID()
    var course: String
    var name: String
    var semester: Int
    var days: [Days] = []
    var startDate: Date
    var endDate: Date
    var startTime: Date
    var endTime: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(course)
        hasher.combine(name)
        hasher.combine(semester)
        hasher.combine(startDate)
        hasher.combine(endDate)
        hasher.combine(days)
        hasher.combine(startTime)
        hasher.combine(endTime)
    }
}

extension Course {
    
    static var defaultValue = Course(id: UUID(), course: "XX0000X", name: "NOMBRE", semester: 0, days: [], startDate: Date(), endDate: Date(), startTime: Date(), endTime: Date())
    
}
