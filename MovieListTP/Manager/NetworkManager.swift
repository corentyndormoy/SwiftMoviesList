//
//  NetworkManager.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import Foundation
import UIKit

/**
 Gère la connexion
 */
struct NetworkManager {
    
    static var shared = NetworkManager()
    let session = URLSession.shared
    
    /**
     Récupère les données en fonction d'une URL
     */
    func fetchData(_ url: URL, completion: @escaping (Data) -> Void) -> Void {
        self.session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil else {
                return
            }
            
            if let data = data {
                completion(data)
            }
        }).resume()
    }
}
