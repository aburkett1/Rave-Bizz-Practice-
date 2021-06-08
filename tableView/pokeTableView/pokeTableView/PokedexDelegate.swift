//
//  PokedexDelegate.swift
//  pokeTableView
//
//  Created by Rave Bizz on 6/2/21.
//

import UIKit

class PokedexDelegate: NSObject, UITableViewDelegate {
    
    weak var controllerDelegate: UIViewController?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = controllerDelegate?.storyboard?.instantiateViewController(identifier: "PokemonDetailsVC") as? PokemonDetailsVC else {
            return
        }
        
        
        let pokemonDataDiskCache = DiskCacheManager(fileName: "\((tableView.dataSource as? PokedexDataSource)?.pokedexModel?.results[indexPath.row].name ?? "nil")-data")
        let pokemonImageDiskCache = DiskCacheManager(fileName: "\((tableView.dataSource as? PokedexDataSource)?.pokedexModel?.results[indexPath.row].name ?? "nil")-image")
        
        if let pokemonData = pokemonDataDiskCache.read(), let pokemonImageData = pokemonImageDiskCache.read() {
            if let decodedModel = try? JSONDecoder().decode(PokemonDetails.self, from: pokemonData) {
                print("pokemonImageData: \(pokemonImageData)")
                vc.configure(pokemonDetails: decodedModel, image: (UIImage(data: pokemonImageData)!))
            }
        } else {
            APIManager.shared.getPokemonData(id: indexPath.row) { decodedModel in
                APIManager.shared.getPokemonImage(pokemonDetails: decodedModel) { imageData in
                    let cachePokemon = DiskCacheManager(fileName: "\(decodedModel.name)-data")
                    try? cachePokemon.cache(item: decodedModel)
                    
                    let cacheImage = DiskCacheManager(fileName: "\(decodedModel.name)-image")
                    try? cacheImage.cacheImage(item: imageData!)
                    
                    DispatchQueue.main.async {
                        vc.configure(pokemonDetails: decodedModel, image: imageData!)
                        vc.updateUI()
                    }
                }
            }
        }
        controllerDelegate?.navigationController?.pushViewController(vc, animated: true)
    }
}
