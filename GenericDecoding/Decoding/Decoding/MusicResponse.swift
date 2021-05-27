//
//  MusicResponse.swift
//  MoreProtocols
//
//  Created by Luat on 5/25/21.
//
/// https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json
import Foundation

/// Get artistName, name, and releaseDate
struct MusicResponse: Decodable {
    struct Feed: Decodable {
        struct Results: Decodable {
            let artistName: String
            let name: String
            let releaseDate: String
        }
        let results: [Results]
    }
    let feed: Feed
}

struct Feed: Decodable {
    let results: [[String:String]]
}

struct Results: Decodable {
    let artistName: String
    let name: String
    let releaseDate: String
}
