//
//  PokemonDetailsVC.swift
//  pokeTableView
//
//  Created by Rave Bizz on 6/1/21.
//

import UIKit

class PokemonDetailsVC: UIViewController {
    
    static let shared = PokemonDetailsVC()
    
    @IBOutlet var pokemonView: UIView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    
    var pokemonModel: PokemonDetails? {
        didSet {
            DispatchQueue.main.async {
//                self.pokemonView.reloadData()
            }
        }
    }
    
    var pokemonImageData: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    
    func configure() {
        pokemonLabel.text = pokemonModel?.name
        pokemonImageView.image = pokemonImageData
    }
    
}
