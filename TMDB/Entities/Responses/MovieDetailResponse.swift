//
//  MovieDetailResponse.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation

struct DetailMoviesResponse: Codable {
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: BelongsToCollection?
    let budget: CUnsignedLongLong?
    let genres: [MovieGenresModel]?
    let homepage: String?
    let id: Int?
    let imdbId, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let releaseDate: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}

struct BelongsToCollection: Codable {
    let id: Int?
    let name, posterPath, backdropPath: String?
}

struct ProductionCompany: Codable {
    let id: Int?
    let logoPath: String?
    let name, originCountry: String?
}
