//
//  MovieInfoView.swift
//  App02-TMDB
//
//  Created by Jorge on 04/09/24.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    var movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdropPath)"))
                .cacheMemoryOnly()
                .fade(duration: 0.25)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            Text(movie.title)
                .font(.title)
                .padding(.top, 8)
            
            Text("Release Date: \(movie.releaseDate)")
                .padding(.top, 4)
            
            Text(movie.overview)
                .padding(.top, 8)
            
            Spacer()
        }
        .padding()
        .navigationTitle(movie.title)
    }
}

#Preview {
    MovieDetailView(movie: Movie.defaultMovie)
}
