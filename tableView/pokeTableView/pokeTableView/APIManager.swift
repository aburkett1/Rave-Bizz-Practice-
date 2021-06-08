//
//  APIManager.swift
//  pokeTableView
//
//  Created by Rave Bizz on 6/1/21.
//

import UIKit

class APIManager {
    
    static let shared = APIManager()
    
    func getPokedexData<T: Codable>(completion: ((T?) -> Void)?) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            print("Pokedex URL is not Valid")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error Downloading Data")
                return
            }
            guard error == nil else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            do {
                let decodedPokedex = try JSONDecoder().decode(PokedexModel.self, from: data)
                completion?(decodedPokedex as? T)
                try? DiskCacheManager().cache(item: decodedPokedex)
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getPokemonData(id: Int, completion: ((PokemonDetails) -> Void)?) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id+1)") else {
            print("Pokemon URL is not Valid")
            return
        }
        let taskGetPokemon = URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else {
                print("Error Downloading Data")
                return
            }
            guard error == nil else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            do {
                let decodedPokemon = try JSONDecoder().decode(PokemonDetails.self, from: data)
                completion?(decodedPokemon)
                
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
        taskGetPokemon.resume()
    }
    
    func getPokemonImage(pokemonDetails: PokemonDetails, completion: ((UIImage?) -> Void)?) {
        let taskGetImage = URLSession.shared.dataTask(with: URL(string: pokemonDetails.sprites.other.artwork.front_default)!) { d, r, e in
            guard let data = d else {
                print("Error Downloading Data")
                return
            }
            guard e == nil else {
                if let error = e {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            completion?(UIImage(data: data))
//            completion?(data)
        }
        taskGetImage.resume()
    }
}
