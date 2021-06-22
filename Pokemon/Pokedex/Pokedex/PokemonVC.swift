//
//  PokemonVC.swift
//  Pokedex
//
//  Created by Rave Bizz on 6/8/21.
//

import UIKit

class PokemonVC: UIViewController {
    
    @IBOutlet var overallView: UIView!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonImageBackground: UIView!
    
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonType1View: UIView!
    @IBOutlet weak var pokemonType1Label: UILabel!
    
    @IBOutlet weak var pokemonType2View: UIView!
    @IBOutlet weak var pokemonType2Label: UILabel!
    
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    
    @IBOutlet weak var hpBar: UIProgressView!
    @IBOutlet weak var atkBar: UIProgressView!
    @IBOutlet weak var defBar: UIProgressView!
    @IBOutlet weak var spAtkBar: UIProgressView!
    @IBOutlet weak var spDefBar: UIProgressView!
    @IBOutlet weak var spdBar: UIProgressView!
    
    
    var pokemon: Pokemon?
    var image: UIImage?
    
    func configure(pokemon: Pokemon?, image: UIImage?) {
        self.pokemon = pokemon
        self.image = image
    }
    
    func updateUI() {
        guard let pokemon = pokemon else { return }
        /// Overall View
        overallView.backgroundColor = UIColor(hex: "#2b292c")
        
        /// Navigation Controller
        navigationController?.navigationBar.barTintColor = TypeColor.type[pokemon.types[0].type.name.capitalized]
        
        
        /// Top View
        /// Background
        pokemonImageBackground.backgroundColor = TypeColor.type[pokemon.types[0].type.name.capitalized]
        
        /// Image
        pokemonImage.image = image
        pokemonImageBackground.layer.cornerRadius = pokemonImageBackground.bounds.width / 5
        pokemonImageBackground.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        
        /// Middle View
        /// Pokemon Name
        pokemonName.text = pokemon.name.capitalized
        /// Type 1
        /// Label
        pokemonType1Label.text = pokemon.types[0].type.name.capitalized
        /// Background Circle
        pokemonType1View.backgroundColor = TypeColor.type[pokemon.types[0].type.name.capitalized]
        print("Bound's Height: \(pokemonType1View.bounds.height)")
        print("Bound's 1/2 Height: \(pokemonType1View.bounds.height/2)")
        pokemonType1View.layer.cornerRadius = pokemonType1View.bounds.height/2 //23.5//35
        
        /// Type 2
        /// Label
        if pokemon.types.count == 2 {
            pokemonType2Label.text = pokemon.types[1].type.name.capitalized
            /// Background Circle
            pokemonType2View.backgroundColor = TypeColor.type[pokemon.types[1].type.name.capitalized]
            pokemonType2View.layer.cornerRadius = pokemonType2View.bounds.height/2
        }
        
        /// Weight
        pokemonWeight.text = "\(pokemon.weight / 10) KG"
        
        /// Height
        pokemonHeight.text = "\(pokemon.height) M"
        
        
        /// Bottom View
        /// Hp
        hpBar.progress = pokemon.stats[0].base_stat / 255
        /// AtK
        atkBar.progress = pokemon.stats[1].base_stat / 190
        /// Def
        defBar.progress = pokemon.stats[2].base_stat / 250
        /// Sp. Atk
        spAtkBar.progress = pokemon.stats[3].base_stat / 194
        /// Sp. Def
        spDefBar.progress = pokemon.stats[4].base_stat / 250
        /// Spd
        spdBar.progress = pokemon.stats[5].base_stat / 200
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    deinit {
        print("Deiniting")
        
    }
}
