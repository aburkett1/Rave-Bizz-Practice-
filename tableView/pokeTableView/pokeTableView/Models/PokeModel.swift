//
//  PokeModel.swift
//  pokeTableView
//
//  Created by Rave Bizz on 5/28/21.
//

import Foundation

struct PokeModel: Decodable {
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
}

