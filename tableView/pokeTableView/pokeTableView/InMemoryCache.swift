//
//  InMemoryCache.swift
//  pokeTableView
//
//  Created by Rave Bizz on 6/7/21.
//

import UIKit

class ImageCache {
    private init () {}
    static let shared = ImageCache()
//    var cache: [String: Data?] = [:] // .atomicWrite
    var nsCache: NSCache<NSString, UIImage> = NSCache()
    
    func read() {
        nsCache.object(forKey: "imageURL")
    }
    func write() {
        nsCache.setObject(UIImage(systemName: "pencil")!, forKey: "imageUrl")
    }
    
    
}
