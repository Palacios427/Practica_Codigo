//
//  ContentView.swift
//  app-01
//
//  Created by Jorge on 06/08/24.
//

import SwiftUI

struct ScheduleView: View {
    
    @Environment(Student.self) private var student
    @Environment(Courses.self) private var courses
    
    var body: some View {
        NavigationStack {
            ZStack {
                //            Color.mint
                VStack {
                    List {
                        ForEach(courses.courses) { course in
                            NavigationLink(value: course) {
                                VStack {
                                    HStack {
                                        Text(course.course)
                                        Text(course.name)
                                    }
                                }
                            }
                            
                        }
                    }
                    .padding(.top, 20)
                    .listStyle(.inset)
                }
            }
            .navigationTitle("Main View")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CourseDetailView(course: Course.defaultValue)) {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                }
            }
            //            .ignoresSafeArea()
            //Poner el nombre de la pantalla en vez del estudiante
            .navigationDestination(for: Course.self) { course in
                CourseDetailView(course: course)
            }
        }
    }
}

#Preview {
    ScheduleView()
        .environment(Student.defaultValue)
        .environment(Courses())
}
