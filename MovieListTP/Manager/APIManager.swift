//
//  APIManager.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import Foundation

/**
 Gère les URL de l'API
 */
struct APIManager {
    static var shared = APIManager()
    
    let baseUrl = "https://api.themoviedb.org/3"
    let apiKey = "e01d3793183b5f190884d30d93a40479"
    let imageBaseUrl = "https://image.tmdb.org/t/p/"
    
    /**
        Crée une URLComponents  avec les endpoints de l'API et les paramètres
     */
    func buildUrl(path: ApiEndpoint, queryParams: [URLQueryItem]? = nil) -> URLComponents? {
        var url = URLComponents(string: "\(self.baseUrl)\(path.rawValue)")
        url?.queryItems = [
            URLQueryItem(name: "api_key", value: self.apiKey),
            URLQueryItem(name: "language", value: "fr-FR")
        ]
        
        if let params = queryParams {
            url?.queryItems! += params
        }
        
        return url
    }
}

/**
 Enum des endpoints de l'API de MovieDB
 */
enum ApiEndpoint: String {
    case list = "/discover/movie"
    case details = "/movie/"
    case categories = "/genre/movie/list"
}
