//
//  ViewController.swift
//  Decoding
//
//  Created by Luat on 5/26/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let jokes = getJokes()
//        print(jokes?.value ?? "")
//
//        let shows = getShows()
//        print(shows ?? "")
//
//        let drinks = getDrinks()
//        print(drinks ?? "")
//
//        let musics = getMusics()
//        print(musics ?? "")
        
// Todo: get any reponse, passing in fileName
        let models: JokeResponse? = getAnyResponse(fileName: "JokeResponse")
        print(models ?? "")

    }
    
    func getJokes() -> JokeResponse? {
        /// Getting path to file
        let bundlePath = Bundle.main.path(forResource: "JokeResponse", ofType: "json")
        
        /// Getting DATA type from the string in that file
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        
        /// Decoding from DATA type to a custom struct
        let decoder = JSONDecoder()
        let jokes = try! decoder.decode(JokeResponse.self, from: jsonData!)
        
        return jokes
    }
    
    /// All these functions are very similar...
    func getShows() -> ShowResponse? {
        /// Getting path to file
        let bundlePath = Bundle.main.path(forResource: "ShowResponse", ofType: "json")
        
        /// Getting DATA type from the string in that file
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        
        /// Decoding from DATA type to a custom struct
        let decoder = JSONDecoder()
        let shows = try! decoder.decode(ShowResponse.self, from: jsonData!)
        
        return shows
    }
    
    func getDrinks() -> DrinkResponse? {
        /// Getting path to file
        let bundlePath = Bundle.main.path(forResource: "DrinkResponse", ofType: "json")
        
        /// Getting DATA type from the string in that file
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        
        /// Decoding from DATA type to a custom struct
        let decoder = JSONDecoder()
        let drinks = try! decoder.decode(DrinkResponse.self, from: jsonData!)
        
        return drinks
    }
    
    func getMusics() -> MusicResponse? {
        /// Getting path to file
        let bundlePath = Bundle.main.path(forResource: "MusicResponse", ofType: "json")
        
        /// Getting DATA type from the string in that file
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        
        /// Decoding from DATA type to a custom struct
        let decoder = JSONDecoder()
        let musics = try! decoder.decode(MusicResponse.self, from: jsonData!)
        
        return musics
    }
    
    func getAnyResponse<T: Decodable>(fileName: String) -> T? {
        /// Getting path to file
        let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json")
        
        /// Getting DATA type from the string in that file
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        
        switch fileName {
        case "JokeResponse":
            let decoder = JSONDecoder()
            let jokes = try! decoder.decode(T.self, from: jsonData!)
            
            return jokes
        case "DrinkResponse":
            let decoder = JSONDecoder()
            let drinks = try! decoder.decode(T.self, from: jsonData!)
            
            return drinks
        case "ShowRepsonse":
            let decoder = JSONDecoder()
            let shows = try! decoder.decode(T.self, from: jsonData!)
            
            return shows
        case "MusicResponse":
            let decoder = JSONDecoder()
            let musics = try! decoder.decode(T.self, from: jsonData!)
            
            return musics
        default:
            return nil
        }
    }
}

