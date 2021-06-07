//
//  Movie.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import Foundation

struct Movie {
    var id: Int
    var title: String
    var subtitle: String?
    var year: Int?
    var duration: Int?
    var categories: [String]?
    var synopsis: String?
    var trailerUrl: String?
    var imageUrl: String?
    var posterUrl: String?
    
    /**
     Constructeur pour un Movie
     */
    init?(from movieResponse: MovieResponse) {
        guard let id = movieResponse.id, let title = movieResponse.title, let year = movieResponse.releaseDate else {
            return nil
        }
        self.id = id
        self.title = title
        self.year = Int(String(year.prefix(4)))
        self.synopsis = movieResponse.overview
        if let backdrop = movieResponse.backdropPath {
            self.imageUrl = APIManager.shared.imageBaseUrl + "w500" + backdrop
        }
    }
    
    /**
     Constructeur pour un Movie avec davantage de détails
     */
    init?(from movieDetailsResponse: MovieDetailsResponse) {
        guard let id = movieDetailsResponse.id,
            let title = movieDetailsResponse.title,
            let year = movieDetailsResponse.releaseDate,
            let poster = movieDetailsResponse.posterPath else {
            return nil
        }
        self.id = id
        self.title = title
        self.subtitle = movieDetailsResponse.tagline
        self.year = Int(String(year.prefix(4)))
        self.synopsis = movieDetailsResponse.overview
        if let backdrop = movieDetailsResponse.backdropPath {
            self.imageUrl = APIManager.shared.imageBaseUrl + "w500" + backdrop
        }
        self.posterUrl = APIManager.shared.imageBaseUrl + "w200" + poster
        self.duration = movieDetailsResponse.runtime
        self.categories = movieDetailsResponse.genres?.compactMap({ genre -> String? in
            guard let name = genre.name else {
                return nil
            }
            return name
        })
    }
    
    /**
     Retourne la categorie en String
     @return String
     */
    func getCategoriesAsString() -> String {
        guard let categories = self.categories else {
            return "-"
        }
        return categories.joined(separator: ", ")
     }
    
    /**
     Retourne la durée du film en String
     @return String
     */
    func getDurationAsString() -> String {
        guard let duration = self.duration else {
            return "-"
        }
        return "\(duration) min"
    }
    
    /**
     Retourne l'URL du trailer
     @return URL
     */
    func getTrailerUrl() -> URL? {
        guard let trailerUrl = self.trailerUrl else {
            return nil
        }
        return URL(string: trailerUrl)
    }
    
    /**
     Retourne l'URL de l'image
     @return URL
     */
    func getImageUrl() -> URL? {
        guard let imageUrl = self.imageUrl else {
            return nil
        }
        return URL(string: imageUrl)
    }
    
    /**
     Retourne l'URL du poster
     @return URL
     */
    func getPosterUrl() -> URL? {
        guard let posterUrl = self.posterUrl else {
            return nil
        }
        return URL(string: posterUrl)
    }
}
