//
//  Pokemon.swift
//  Pokedex
//
//  Created by Rave Bizz on 6/8/21.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let height: Double
    let weight: Double
    let sprites: Sprites
    let types: [PokemonTypes]
    let stats: [Stats]
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

struct Stats: Codable {
    let base_stat: Float
    let stat: Stat
}

struct Stat: Codable {
    let name: String
}
