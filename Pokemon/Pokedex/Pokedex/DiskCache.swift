//
//  DiskCache.swift
//  Pokedex
//
//  Created by Rave Bizz on 6/8/21.
//

import UIKit

/// Get a file path
/// save the data to file

struct DiskCacheManager {
    static let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
    static let cacheDirectory = paths[0]
    
    let cacheFileName: String
    
    init(fileName: String = "your-file-name-cache") {
        self.cacheFileName = fileName
    }
    
    /// data.write
    /// Saves to a file
    func cache<T: Encodable>(item: T) throws {
        /// Encodable item -> create Data instance from item
        let encoder = JSONEncoder()
        let data = try encoder.encode(item)
        let fileName = DiskCacheManager.cacheDirectory.appendingPathComponent(cacheFileName)
        /// Saves data to this fileName
        try data.write(to: fileName , options: .atomicWrite)
    }
    
    func cacheImage(item: UIImage) throws {
        if let data = item.pngData() {
            let fileName = DiskCacheManager.cacheDirectory.appendingPathComponent(cacheFileName)
            /// Saves data to this fileName
            try data.write(to: fileName , options: .atomicWrite)
        }
    }
    
    func read() -> Data? {
        let fileUrl = DiskCacheManager.cacheDirectory.appendingPathComponent(cacheFileName)
        if let data = try? Data(contentsOf: fileUrl) {
            return data
        }
        return nil
    }
    
    /// Delete file with this name
    func delete() throws {
        let path = DiskCacheManager.cacheDirectory.appendingPathComponent(cacheFileName)
        try FileManager.default.removeItem(at: path)
    }
    
}
