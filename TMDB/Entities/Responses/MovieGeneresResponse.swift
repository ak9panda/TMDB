//
//  MovieGeneresResponse.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation

struct MovieGenresResponse: Codable {
    var genres: [MovieGenresModel]?
}

struct MovieGenresModel: Codable {
    var id: Int?
    var name: String?
}
