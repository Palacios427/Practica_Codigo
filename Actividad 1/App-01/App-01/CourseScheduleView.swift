//
//  CourseScheduleView.swift
//  app-01
//
//  Created by Jorge on 19/08/24.
//

import SwiftUI

struct CourseScheduleView: View {
    
    @Binding var days: [Days]
    @Binding var startTime: Date
    @Binding var endTime: Date
    @State var duration: Int = 2
    @State var durationFloat: Float = 2.0

    var body: some View {
        VStack {
            HStack {
                ForEach(Days.allCases, id: \.self) { day in
                    Text(day.shortName)
                        .padding()
                        .background(days.contains(day) ? day.color.cornerRadius(10) : Color.gray.cornerRadius(10))
                        .onTapGesture {
                            print(day.name)
                            if days.contains(day) {
                                days.removeAll(where: { $0 == day })
                            } else {
                                days.append(day)
                            }
                            print(days)
                        }
                }
            }
            
            
            DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                .padding(.horizontal, 60)
                .datePickerStyle(.compact)
                .padding()
            
            DatePicker("Finish Time", selection: $endTime, displayedComponents: .hourAndMinute)
                .padding(.horizontal, 60)
                .datePickerStyle(.compact)
                .padding()

            // Uncomment and customize as needed
            /*Text("Duracion: \(String(format: "%.2f", durationFloat))")
            Slider(value: $durationFloat, in:2...4, step: 1)
                .padding()
                .padding(.horizontal, 60)*/
        }
    }
}

#Preview {
    CourseScheduleView(
        days: .constant([]),
        startTime: .constant(Date.now),
        endTime: .constant(Date.now.addingTimeInterval(3600))
    )
}
