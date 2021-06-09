//
//  Pokemon.swift
//  Pokedex
//
//  Created by Rave Bizz on 6/8/21.
//

import Foundation

struct PokemonDetails: Codable {
    let name: String
    let weight: Int
    let sprites: Sprites
    let types: [PokemonTypes]
}

struct Sprites: Codable {
    let other: Other
}

struct Other: Codable {
    enum CodingKeys: String, CodingKey {
        case artwork = "official-artwork"
    }
    let artwork: Image
}

struct Image: Codable {
    let front_default: String
}

struct PokemonTypes: Codable {
    let type: TypeDetails
}

struct TypeDetails: Codable {
    let name: String
}
