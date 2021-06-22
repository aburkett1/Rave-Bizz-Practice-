//
//  PokedexDelegate.swift
//  Pokedex
//
//  Created by Rave Bizz on 6/8/21.
//

import UIKit

extension PokedexVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonStoryboard = UIStoryboard(name: "Pokemon", bundle: nil)
        guard let vc = pokemonStoryboard.instantiateViewController(identifier: "PokemonVC") as? PokemonVC else { return }
        vc.configure(pokemon: pokedex[indexPath.row + 1], image: pokemonImages[indexPath.row + 1])
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
