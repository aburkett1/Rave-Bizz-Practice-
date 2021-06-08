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
                (self.myDataSource as?  PokedexDataSource)?.update(model: self.pokedexModel)
                self.tableView.reloadData()
            }
        }
    }
    
    var myDataSource: UITableViewDataSource!
    var myDelegate = PokedexDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPokedexData()
        configureTableView()
    }
    
    func fetchPokedexData() {
        if let data = DiskCacheManager().read() {
            if let model = try? JSONDecoder().decode(PokedexModel.self, from: data) {
                self.pokedexModel = model
            }
        } else {
            APIManager.shared.getPokedexData { decodedModel in
                self.pokedexModel = decodedModel
            }
        }
    }
    
    func configureTableView() {
        myDataSource = PokedexDataSource(model: pokedexModel)
        tableView.dataSource = myDataSource
        
        myDelegate.controllerDelegate = self
        tableView.delegate = myDelegate
        
        let nib = UINib(nibName: PokemonCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PokemonCell.identifier)
    }
    
    deinit {
        print("PokedexVC deinit")
    }
    
}

