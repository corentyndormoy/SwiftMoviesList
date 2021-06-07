//
//  CategoryListResponse.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import Foundation

struct CategoryListResponse: Decodable {
    let genres: [Genre]?
    
    func transformToCategoryArray() -> [Category] {
        guard let genres = self.genres else {
            return []
        }
        return genres.compactMap { genre -> Category? in
            Category(from: genre)
        }
    }
}

struct Genre: Decodable {
    let id: Int?
    let name: String?
}
