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
        NavigationStack {
            VStack {
                List {
                    ForEach(moviesData.movies) { movie in
                        HStack {
                            Text(movie.title)
                            Spacer()
                            KFImage.url(URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath)"))
                                .cacheMemoryOnly()
                                .fade(duration: 0.25)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                        }
                    }
                }
            }
            .navigationTitle("Movies")
        }
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
