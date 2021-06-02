//
//  PokemonCell.swift
//  pokeTableView
//
//  Created by Rave Bizz on 5/28/21.
//

import UIKit

class PokemonCell: UITableViewCell {

    static let identifier = "PokemonCell"
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
