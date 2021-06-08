//
//  PokeModel.swift
//  pokeTableView
//
//  Created by Rave Bizz on 5/28/21.
//

import Foundation

struct PokedexModel: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String
}
