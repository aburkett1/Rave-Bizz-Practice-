//
//  ViewController.swift
//  pokeTableView
//
//  Created by Rave Bizz on 5/28/21.
//

import UIKit

class ViewController: UITableViewController {

    let urlAddress = "https://pokeapi.co/api/v2/pokemon?limit=151"
    var model: PokeModel? {
        // Property observer: is trigged when new value is set
        didSet {
            // update the UI
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let textName = model?.results[indexPath.row].name
        cell.textLabel?.text = (textName?.prefix(1).capitalized)! + (textName?.dropFirst())!
        return cell
        
    }
    
    
    func getData() {
        let url = URL(string: urlAddress)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decodedDrinks = try JSONDecoder().decode(PokeModel.self, from: data)
                self.model = decodedDrinks
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

}
