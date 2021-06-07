//
//  MoviesRepository.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import Foundation

struct MoviesRepository {
    /**
        Requête qui récupère tous les films d'une catégorie
     */
    func findMoviesByCategory(page: Int = 1, categoryId: Int? = nil, completion: @escaping ((MovieListResponse?) -> Void)) {
        var params: [URLQueryItem] = []
        params.append(URLQueryItem(name: "page", value: "\(page)"))
        if let category = categoryId {
            params.append(URLQueryItem(name: "with_genres", value: "\(category)"))
        }
        
        let moviesUrl = APIManager.shared.buildUrl(path: ApiEndpoint.list, queryParams: params)
        if let url = moviesUrl?.url {
            NetworkManager.shared.fetchData(url) { data in
                completion(try? JSONDecoder().decode(MovieListResponse.self, from: data))
            }
        }
    }
    
    /**
     Requête qui récupère les détails d'un film en fonction d'un id
     */
    func findMovieBy(id: Int, completion: @escaping ((MovieDetailsResponse?) -> Void)) {
        var detailsUrl = APIManager.shared.buildUrl(path: ApiEndpoint.details, queryParams: [
            URLQueryItem(name: "append_to_response", value: "videos")
        ])
        
        detailsUrl?.path += String(id)
        if let url = detailsUrl?.url {
            NetworkManager.shared.fetchData(url) { data in
                completion(try? JSONDecoder().decode(MovieDetailsResponse.self, from: data))
            }
        }
    }
}
