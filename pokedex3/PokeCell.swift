//
//  PokeCell.swift
//  pokedex3
//
//  Created by Julian Bergmann on 10.08.17.
//  Copyright © 2017 Julian Bergmann. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalized
        thumImg.image = UIImage(named:"\(self.pokemon.pokedexId)")
    }


}
