//
//  Category.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import Foundation

struct Category {
    let id: Int
    let name: String
    
    /**
     Constructeur pour une Category
     */
    init?(from genre: Genre) {
        guard let id = genre.id, let name = genre.name else {
            return nil
        }
        self.id = id
        self.name = name
    }
}
