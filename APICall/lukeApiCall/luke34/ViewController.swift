//
//  ViewController.swift
//  luke34
//
//  Created by Luat on 5/27/21.
//

import UIKit

class ViewController: UIViewController {
//    let label: UILabel = UILabel()
//    let pokeLabel: UILabel = UILabel()
    @IBOutlet weak var label: UILabel!
    let button: UIButton = UIButton()
    let pokeImg: UIImage = UIImage()
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(Int.random(in: 1...151))")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        configureLabel()
//        configureButton()
        configureGetRandomPokemon()
    }

    func configureLabel() {
        let labelLocation = CGRect(x: 10, y: 20, width: view.bounds.width - 20, height: 50)
        label.frame = labelLocation
//        label.backgroundColor = .red
        label.textColor = .yellow
        label.textAlignment = .center
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 50.0)
        label.numberOfLines = 0
        label.text = "Pokemon"
        view.addSubview(label)
    }
    
//    func configureButton() {
//        let buttonLocation = CGRect(x: 10, y: 300, width: view.bounds.width - 20, height: 30)
//        button.frame = buttonLocation
//        button.backgroundColor = .red
//
//        button.setTitle("Update Text", for: .normal)
//
//        button.addTarget(self, action: #selector(triggerButton), for: .touchUpInside)
//
//        view.addSubview(button)
//    }
//
//    @objc func triggerButton() {
//        let task = URLSession.shared.dataTask(with: url) { d,r,e in
//            guard let data = d else { return }
//            print(data) // decode with JSONDecoder
//            let decodedDataName = "chuck norris" // decoded with decodabel
//            DispatchQueue.main.async {
//                self.label.text = decodedDataName
//            }
//        }
//        task.resume()
//
//        print("button pressed")
//    }
    
    struct Pokemon: Decodable {
        let name: String
        struct Sprites: Decodable {
            let front_default: String
        }
        let sprites: Sprites
    }
    
    @IBOutlet weak var pokeLabelSB: UILabel!
    
    func configureGetRandomPokemon() {
        pokeLabelSB.frame = CGRect(x: 10, y: view.bounds.height/2 - 15, width: view.bounds.width - 20, height: 30)
        pokeLabelSB.textAlignment = .center
        pokeLabelSB.font = pokeLabelSB.font.withSize(20)
        let task = URLSession.shared.dataTask(with: url) { d,r,e in
            guard let data = d else { return }
            let decoder = JSONDecoder()
            let decodedData = try! decoder.decode(Pokemon.self, from: data)
            DispatchQueue.main.async {
                self.pokeLabelSB.text = decodedData.name.prefix(1).capitalized + decodedData.name.dropFirst()
            }
        }
        task.resume()
        view.addSubview(pokeLabelSB)
    }
    
    
    
}

struct Joke: Decodable {
    let value: String
}
