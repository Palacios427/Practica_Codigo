//
//  Fav.swift
//  App02-TMDB
//
//  Created by Alumno on 21/08/24.
//

import SwiftUI
import SwiftData

@Model

final class Fav {
    
    var id: Int
    var title: String
    var overview: String
    var backdropPath: String
    var genreIds: [Int]
    var originalLanguage: String
    var originalTitle: String
    var popularity: Double
    var posterPath: String
    var releaseDate: String
    var voteAverage: Double
    var voteCount: Int
    
    init(id: Int, title: String, overview: String, backdropPath: String, genreIds: [Int], originalLanguage: String, originalTitle: String, popularity: Double, posterPath: String, releaseDate: String, voteAverage: Double, voteCount: Int) {
        self.id = id
        self.title = title
        self.overview = overview
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
