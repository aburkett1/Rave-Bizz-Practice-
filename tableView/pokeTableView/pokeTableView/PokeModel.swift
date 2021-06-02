//
//  PokeModel.swift
//  pokeTableView
//
//  Created by Rave Bizz on 5/28/21.
//

import Foundation

struct PokedexModel: Decodable {
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}
