//
//  PokemonDetailsModel.swift
//  pokeTableView
//
//  Created by Rave Bizz on 6/1/21.
//

import Foundation

struct PokemonDetails: Decodable {
    let name: String
    let weight: Int
    let sprites: Sprites
    let types: [PokemonTypes]
}

struct Sprites: Decodable {
    let other: Other
}

struct Other: Decodable {
    enum CodingKeys: String, CodingKey {
        case artwork = "official-artwork"
    }
    let artwork: Image
}

struct Image: Decodable {
    let front_default: String
}

struct PokemonTypes: Decodable {
    let type: TypeDetails
}

struct TypeDetails: Decodable {
    let name: String
}
