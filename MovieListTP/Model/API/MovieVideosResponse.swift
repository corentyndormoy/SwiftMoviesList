//
//  MovieVideosResponse.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import Foundation

struct MovieVideosResponse: Decodable {
    let results: [MovieVideo]?
}

struct MovieVideo: Decodable {
    let key: String?
    let site: String?
    let type: String?
    
    func transformToStringUrl() -> String? {
        guard let key = key else {
            return nil
        }
        if self.site == "YouTube" {
            return "https://www.youtube.com/watch?v=\(key)"
        }
        return nil
    }
}

extension Array where Element == MovieVideo {
    func toUrlList() -> [String] {
        return self.compactMap { (movieVideo: MovieVideo) -> String? in
            movieVideo.transformToStringUrl()
        }
    }
}
