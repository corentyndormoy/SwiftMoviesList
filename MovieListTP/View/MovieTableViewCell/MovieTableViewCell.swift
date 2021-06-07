//
//  MovieTableViewCell.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import UIKit

/**
 Cellule d'un film (dans la liste des films)
 */
class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    /**
     Initialisation
     */
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    /**
     Configure la vue pour l'état sélectionné
     */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /**
     Affiche les données en fonction d'un Movie
     */
    func fillDataWith(movie: Movie) {
        self.titleLabel.text = movie.title
        if let year = movie.year {
            self.dateLabel.text = String(year)
        }
    }
    
    /**
     Affiche l'image
     */
    func displayImage(_ image: UIImage) {
        DispatchQueue.main.async() {
            self.movieImageView.image = image
        }
    }
    
    /**
     Retire les informations affichées pour pouvoir les écraser avec de nouvelles informations
     */
    override func prepareForReuse() {
        self.titleLabel.text = nil
        self.movieImageView.image = nil
        self.dateLabel.text = nil
    }
    
    static var nib: UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return "MovieTableViewCell"
    }
}
