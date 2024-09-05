//
//  CourseDetailView.swift
//  app-01
//
//  Created by Jorge on 13/08/24.
//

import SwiftUI

struct CourseDetailView: View {
    
    @Environment(Courses.self) private var courses
    @Environment(\.dismiss) private var dismiss
    @State var course: Course
    
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                Text("Curso:")
                TextField("Curso", text: $course.course)
                    .textFieldStyle(.roundedBorder)
                Text("Nombre del Curso:")
                TextField("Nombre del Curso", text: $course.name)
                    .textFieldStyle(.roundedBorder)
                
                DatePicker("Fecha de inicio", selection: $course.startDate, displayedComponents: .date)
                
                DatePicker("Fecha final", selection: $course.endDate, displayedComponents: .date)
                
                Spacer()
                    .frame(height: 25)
                
                CourseScheduleView(days: $course.days, startTime: $course.startTime, endTime: $course.endTime)

                Spacer()
                
                Button("Save") {
                    saveCourse()
                }
                .foregroundColor(.blue)
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(8)
                
                Button ("Delete") {
                    deleteCourse()
                }
                .foregroundColor(.red)
                .padding()
                .background(Color.red.opacity(0.2))
                .cornerRadius(8)
            }
            .padding(.horizontal,20)
        }
    }
    
    func saveCourse() {
        if let index = courses.courses.firstIndex(where: { $0.id == course.id }) {
            courses.courses[index] = course
        }
        else {
            courses.courses.append(course)
        }
        dismiss()
    }
        
    func deleteCourse() {
        courses.courses.removeAll { $0.id == course.id }
        dismiss()
    }
}


#Preview {
    CourseDetailView(course: Course.defaultValue)
        .environment(Courses())
}
