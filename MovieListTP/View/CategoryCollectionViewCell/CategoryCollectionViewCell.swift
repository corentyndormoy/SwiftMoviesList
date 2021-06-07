//
//  CategoryCollectionViewCell.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import UIKit

/**
 Cellule d'une catégorie (dans la liste des catégories)
 */
class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstLetterLabel: UILabel!
    
    /**
     Initialisation
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = false
    }
    
    func configureWithName(name: String) {
        nameLabel.text = name
    }
    
    static var nib: UINib {
        UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
    
    static var reuseIdentifier: String {
        "CategoryCollectionViewCell"
    }
}
