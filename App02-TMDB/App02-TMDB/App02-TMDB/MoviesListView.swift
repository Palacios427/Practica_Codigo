//
//  MoviesListView.swift
//  App02-TMDB
//
//  Created by David Cantú Delgado on 20/08/24.
//

import SwiftUI
import Kingfisher

struct MoviesListView: View {
    
    @Environment(MoviesData.self) var moviesData
    
    var body: some View {
            VStack {
                List {
                    ForEach(moviesData.movies) { movie in
                        HStack {
                            Text(movie.title)
                            Spacer()
                            MoviePosterView(movie: movie)
                        }
                    }
                }
            }
            .navigationTitle("Movies")
        .onAppear {
            Task {
                await moviesData.fetchMovies()
            }
        }
    }
}

#Preview {
    MoviesListView()
        .environment(MoviesData())
}
