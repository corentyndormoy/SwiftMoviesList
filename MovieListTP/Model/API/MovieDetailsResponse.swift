//
//  MovieDetailsResponse.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import Foundation

struct MovieDetailsResponse: Decodable {
    let id: Int?
    let backdropPath: String?
    let overview: String?
    let tagline: String?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let runtime: Int?
    let genres: [Genre]?
    let videos: MovieVideosResponse?

    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case tagline
        case video
        case runtime
        case genres
        case videos
    }
}
