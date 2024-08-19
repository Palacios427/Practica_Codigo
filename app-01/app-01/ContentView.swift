//
//  ContentView.swift
//  app-01
//
//  Created by Alumno on 06/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 0) {
            HStack(spacing: 0) {
                ZStack{
                    Color.pink
                    VStack {
                        Image(systemName: "triangle")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                            .font( .system(size:64))
                        Text("Hello, world!")
                    }
                }
                ZStack{
                    Color.blue
                    VStack {
                        Image(systemName: "football")
                            .imageScale(.large)
                            .foregroundStyle(.pink)
                            .font(. system(size: 40))
                        Text("Hello, world!")
                            .foregroundStyle(.green)
                            .font( .system(size: 30))
                    }
                }
            }
            HStack (spacing: 0) {
                ZStack {
                    Color.orange
                    HStack {
                        Image(systemName: "diamond")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                            .font (. system(size: 50))
                        Text("ESTE ES DIFERENTE!")
                    }
                }
                ZStack {
                    Color.green
                    VStack {
                        Image(systemName: "square")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Hello, world!")
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}
#Preview {
    ContentView()
}
