//
//  APIManager.swift
//  Pokedex
//
//  Created by Rave Bizz on 6/8/21.
//

import UIKit

class APIManager {
    
    static let shared = APIManager()
    
    func getPokemonData(id: Int, completion: ((Pokemon) -> Void)?) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else {
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
                let decodedPokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                completion?(decodedPokemon)
                
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
        taskGetPokemon.resume()
    }
    
    func getPokemonImage(pokemon: Pokemon, completion: ((UIImage?) -> Void)?) {
        let taskGetImage = URLSession.shared.dataTask(with: URL(string: pokemon.sprites.other.artwork.front_default)!) { d, r, e in
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
