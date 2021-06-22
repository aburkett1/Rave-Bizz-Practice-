//
//  PokedexVC.swift
//  Pokedex
//
//  Created by Rave Bizz on 6/8/21.
//

import UIKit

class PokedexVC: UIViewController {
    
    @IBOutlet weak var pokemonCollection: UICollectionView!
    
    var pokedex: [Int: Pokemon] = [:] 
    var pokemonImages: [Int: UIImage] = [:] {
        didSet {
            if pokedex.count % 20 == 0 && pokemonImages.count % 20 == 0 {
                DispatchQueue.main.async {
                    self.pokemonCollection.reloadData()
                }
                fetchData(from: pokedex.count + 1, to: pokedex.count + 20)
            }
            if pokedex.count == 898 && pokemonImages.count == 898 {
                DispatchQueue.main.async {
                    self.pokemonCollection.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        fetchData(from: 1, to: 20)
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool = false) {
        navigationController?.navigationBar.barTintColor = .systemRed
    }
    
    func configureCollectionView() {
        pokemonCollection.dataSource = self
        pokemonCollection.delegate = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        pokemonCollection.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func fetchData(from: Int, to: Int) {
        for i in from...to {
            if i == 899 { break }
//            print("Fetching \(i)")
            APIManager.shared.getPokemonData(id: i) { pokemon in
                /// Set Pokemon in pokedex at id
                self.pokedex[i] = pokemon
//                print("Fetched \(pokemon.name) at ID: \(i)")
                /// Check to see if pokemon's image is cached
                let diskManager = DiskCacheManager(fileName: "\(pokemon.name)-image")
                
                /// If cached, put Image in pokemonImages at id
                if let data = diskManager.read() {
                    self.pokemonImages[i] = UIImage(data: data)
                /// If not cached, throw it in pokemonImages and cache it
                } else {
                    APIManager.shared.getPokemonImage(pokemon: pokemon) { pokemonImage in
                        self.pokemonImages[i] = pokemonImage
                        
                        if let pokemonImage = pokemonImage {
                            try? diskManager.cacheImage(item: pokemonImage)
                        }
                    }
                }
            }
        }
    }
    
}
