//
//  ListViewController.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import UIKit

/**
 Contrôle la page de liste
 */
class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let segueIdentifier = "showDetailsSegue"
    private let moviesRepository = MoviesRepository()
    private let imageCacheManager = ImageCacheManager()
    
    var movies: [Movie] = []
    var category: Category?
    private var currentPage = 1
    private var shouldLoadMoreData = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.reuseIdentifier)
        tableView.register(CategoryTitleTableViewCell.nib, forCellReuseIdentifier: CategoryTitleTableViewCell.reuseIdentifier)
        loadData(page: currentPage)
    }
    
    /**
     Récupère tous les films de la catégorie à afficher
     */
    private func loadData(page: Int) {
        moviesRepository.findMoviesByCategory(page: page, categoryId: category?.id, completion: { response in
            if let movies = response {
                self.shouldLoadMoreData = page < movies.totalPages ?? 0
                let newData = movies.transformToMovieArray()
                var newIndexPaths = [IndexPath]()
                for rowPosition in 0..<newData.count {
                    let newIndexPath = IndexPath(row: self.movies.count + rowPosition, section: 1)
                    newIndexPaths.append(newIndexPath)
                }
                DispatchQueue.main.async() {
                    self.movies += newData
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: newIndexPaths, with: .fade)
                    self.tableView.endUpdates()
                }
            }
        })
    }
    
    /**
     Crée une cellule Movie
     */
    func createMovieCell(_ tableView: UITableView,_ index: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier, for: index) as! MovieTableViewCell
        cell.prepareForReuse()
        let movie = movies[index.item]
        cell.fillDataWith(movie: movie)
        guard let url = movie.getImageUrl() else {
            return cell
        }

        imageCacheManager.getImage(url: url) { image, imageUrl in
            DispatchQueue.main.async() {
                if imageUrl ==  url.absoluteString {
                    cell.displayImage(image)
                }
            }
        }
        return cell
    }
    
    /**
     Crée une cellule Category
     */
    func createCategoryCell(_ tableView: UITableView,_ index: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTitleTableViewCell.reuseIdentifier, for: index) as! CategoryTitleTableViewCell
        cell.titleLabel.text = category?.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let movieViewController = segue.destination as! MovieViewController
            if let id = sender as? Int {
                movieViewController.movieId = id
            }
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
           return createCategoryCell(tableView, indexPath)
        } else {
            return createMovieCell(tableView, indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0: return 1
            case 1: return movies.count
            default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0

        UIView.animate(
            withDuration: 0.2,
            delay: 0.1,
            animations: {
                cell.alpha = 1
        })
        
        if indexPath.row == movies.count - 1 && shouldLoadMoreData {
            currentPage += 1
            loadData(page: currentPage)
        }
    }
}


extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            self.performSegue(withIdentifier: segueIdentifier, sender: movies[indexPath.item].id)
        }
    }
}
