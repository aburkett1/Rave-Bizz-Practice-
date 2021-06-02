//
//  PokedexViewController.swift
//  pokeTableView
//
//  Created by Rave Bizz on 6/1/21.
//

import UIKit

class PokedexVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokedexModel: PokedexModel? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        APIManager.shared.getPokedexData { decodedModel in
            self.pokedexModel = decodedModel
        }
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: PokemonCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PokemonCell.identifier)
    }
    
    deinit {
        print("music VC deinit")
    }
    
    
}


extension PokedexVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedexModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Not Valid PokeCell"
            return cell
            
        }
        cell.pokemonLabel.text = (pokedexModel?.results[indexPath.row].name.dropLast(pokedexModel!.results[indexPath.row].name.count - 1).capitalized)! + (pokedexModel?.results[indexPath.row].name.dropFirst(1))!
        return cell
    }
}

extension PokedexVC: UITableViewDelegate {
    // Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "PokemonDetailsVC") else {
            return
        }
        APIManager.shared.getPokemonData(id: indexPath.row) { decodedModel in
            PokemonDetailsVC.shared.pokemonModel = decodedModel
            APIManager.shared.getPokemonImage(pokemonDetails: decodedModel) { imageData in
                PokemonDetailsVC.shared.pokemonImageData = imageData
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
