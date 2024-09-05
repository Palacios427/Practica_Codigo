//
//  ContentView.swift
//  app-01
//
//  Created by Jorge on 06/08/24.
//


import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var student: Student
    @EnvironmentObject private var courses: Courses
    @State private var showMenu = false
    @State private var selectedMenuOption: SideMenuOptionModel = .courses
    @State private var isShowingCourseDetail: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedMenuOption) {
                    
                    ScheduleView()
                        .tag(SideMenuOptionModel.courses)
                    
                    Text("Page 2")
                        .tag(SideMenuOptionModel.calendar)
                    
                    EditStudentView(student: student)
                        .tag(SideMenuOptionModel.profile)
                }
                
                NavigationMenu(isShowing: $showMenu, selectedTab: $selectedMenuOption)
            }
            .navigationTitle(selectedMenuOption.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                    .foregroundColor(.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if selectedMenuOption == .courses {
                        Button(action: {
                            isShowingCourseDetail = true
                        }) {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                    }
                }
            }
            .toolbarBackground(Color.pink, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationDestination(isPresented: $isShowingCourseDetail) {
                CourseDetailView(course: Course.defaultValue)
                    .environmentObject(courses)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Student.defaultValue)
        .environmentObject(Courses())
}
