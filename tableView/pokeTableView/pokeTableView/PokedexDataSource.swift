//
//  PokedexDataSource.swift
//  pokeTableView
//
//  Created by Rave Bizz on 6/2/21.
//

import UIKit

class PokedexDataSource: NSObject, UITableViewDataSource {
    
    var pokedexModel: PokedexModel?
    
    init(model: PokedexModel?) {
        pokedexModel = model
    }
    
    func update(model: PokedexModel?) {
        pokedexModel = model
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Inside Number of Rows", section)
        return pokedexModel?.results.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Inside PokedexDataSource")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Not Valid PokeCell"
            return cell
            
        }
        cell.pokemonLabel.text = pokedexModel?.results[indexPath.row].name.capitalized
        
        return cell
    }
}
