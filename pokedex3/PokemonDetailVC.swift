//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Julian Bergmann on 11.08.17.
//  Copyright © 2017 Julian Bergmann. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        
        
        pokemon.domnloadPokemonDetails {
            // after the network call is complete
            self.updateUI()
        }
    
}
    
    func updateUI() {
        
        
        baseAttackLbl.text = pokemon.attack
        weightLbl.text = pokemon.weight
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId  == "" {
            
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
            
        } else {
            
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) -LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
        
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
   

}
