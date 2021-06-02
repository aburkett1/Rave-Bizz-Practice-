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
        APIManager.shared.getPokemonData(id: indexPath.row) { decodedModel in
            APIManager.shared.getPokemonImage(pokemonDetails: decodedModel) { imageData in
                DispatchQueue.main.async {
                    vc.configure(pokemonDetails: decodedModel, image: imageData!)
                }
            }
        }
        controllerDelegate?.navigationController?.pushViewController(vc, animated: true)
    }
}
