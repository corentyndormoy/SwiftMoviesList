//
//  CategoryTitleTableViewCell.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import UIKit

/**
 Entête d'une catégorie
 */
class CategoryTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
   
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
    
    static var nib: UINib {
        return UINib(nibName: "CategoryTitleTableViewCell", bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return "CategoryTitleTableViewCell"
    }
}
