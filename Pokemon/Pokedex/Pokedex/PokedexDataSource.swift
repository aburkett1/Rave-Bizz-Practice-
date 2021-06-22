//
//  PokedexDataSource.swift
//  Pokedex
//
//  Created by Rave Bizz on 6/8/21.
//

import UIKit

extension PokedexVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.label.text = pokedex[indexPath.row + 1]?.name.capitalized ?? "nil"
        if UIScreen.main.bounds.width > 1000 {
            cell.label.font = cell.label.font.withSize(60)
        } else {
            cell.label.font = cell.label.font.withSize(20)
        }
//        cell.label.adjustsFontSizeToFitWidth = true
        cell.imageView.image = pokemonImages[indexPath.row + 1]
        cell.backgroundColor = TypeColor.type[pokedex[indexPath.row + 1]?.types[0].type.name.capitalized ?? "Not a Vaild Type"]
        cell.layer.cornerRadius = cell.bounds.width/5.5
        
        return cell
    }
    
}
