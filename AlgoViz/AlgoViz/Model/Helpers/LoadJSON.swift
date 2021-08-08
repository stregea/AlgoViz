//
//  LoadJSON.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

/// Parse a JSON file into a structure.
/// Code taken from SwiftUI tutorial todo: insert link here.
/// - Parameter filename: The name of the  JSON file to parse.
/// - Returns: A decoded JSON file
func load<T: Decodable>(_ filename: String) -> T {
    let data : Data
    
    // Find the file
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    // Load the data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // Decode the JSON
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        print(data)

        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
