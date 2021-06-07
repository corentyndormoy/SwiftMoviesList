//
//  CategoriesRepository.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import Foundation

struct CategoriesRepository {
    
    /**
        Requête qui récupère toutes les catégories de film
     */
    func findAllCategories(completion: @escaping ((CategoryListResponse?) -> Void)) {
        let categoriesUrl = APIManager.shared.buildUrl(path: ApiEndpoint.categories, queryParams: nil)
        
        if let url = categoriesUrl?.url {
            NetworkManager.shared.fetchData(url) { data in
                completion(try? JSONDecoder().decode(CategoryListResponse.self, from: data))
            }
        }
    }
}
