//
//  TitleCollectionViewCell.swift
//  MovieListTP
//
//  Created by  on 31/05/2021.
//  Copyright © 2021 Corentyn. All rights reserved.
//

import UIKit

/**
 Entête de la page des catégories
 */
class TitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    /**
     Initialisation
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = "Categories de film"
    }
    
    static var nib: UINib {
        return UINib(nibName: "TitleCollectionViewCell", bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return "TitleCollectionViewCell"
    }
}
