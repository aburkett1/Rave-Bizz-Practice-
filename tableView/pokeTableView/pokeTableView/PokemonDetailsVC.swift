//
//  PokemonDetailsVC.swift
//  pokeTableView
//
//  Created by Rave Bizz on 6/1/21.
//

import UIKit

class PokemonDetailsVC: UIViewController {
    
    
    @IBOutlet weak var pokemonSubView: UIView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    
    var pokemonModel: PokemonDetails?
    var pokemonImageData: UIImage?
    
    func configure(pokemonDetails: PokemonDetails, image: UIImage) {
        pokemonLabel.numberOfLines = 0
        var pokemonType: String
        if pokemonDetails.types.count == 2 {
            pokemonType = pokemonDetails.types[0].type.name.capitalized + " / " + pokemonDetails.types[1].type.name.capitalized
        } else {
            pokemonType = pokemonDetails.types[0].type.name.capitalized
        }
        pokemonLabel?.text = """
            Name: \(pokemonDetails.name.capitalized)
            Weight: \("\(Double(pokemonDetails.weight) / 10) kg")
            Type: \(pokemonType)
            """
        pokemonImageView?.image = image
        
        let typeColor: [String: UIColor] = [
            "Bug": UIColor(hex: "#96a717")!,
            "Dark": UIColor(hex: "#42382f")!,
            "Dragon": UIColor(hex: "#574897")!,
            "Electric": UIColor(hex: "#f4b624")!,
            "Fairy": UIColor(hex: "#f1adf2")!,
            "Fighting": UIColor(hex: "#6b2c1a")!,
            "Fire": UIColor(hex: "#cf2a03")!,
            "Flying": UIColor(hex: "#7b8ce1")!,
            "Ghost": UIColor(hex: "#515088")!,
            "Grass": UIColor(hex: "#59a128")!,
            "Ground": UIColor(hex: "#c2a757")!,
            "Ice": UIColor(hex: "#94e3fa")!,
            "Normal": UIColor(hex: "#c3bbb0")!,
            "Poison": UIColor(hex: "#863e87")!,
            "Psychic": UIColor(hex: "#e1457b")!,
            "Rock": UIColor(hex: "#e1457b")!,
            "Steel": UIColor(hex: "#a9abb5")!,
            "Water": UIColor(hex: "#308de8")!,
        ]
        pokemonSubView.backgroundColor = typeColor[pokemonDetails.types[0].type.name.capitalized]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func configure() {
        pokemonLabel.text = pokemonModel?.name
        pokemonImageView.image = pokemonImageData
    }
    
}
