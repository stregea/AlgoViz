//
//  LoadJSON.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation
extension Dictionary {

    var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }

    func printJson() {
        print(json)
    }

}

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


func unload(filename: String, data: Dictionary<String, Any>){

    // Find the file
    let file: FileHandle? = FileHandle(forWritingAtPath: "Resources/\(filename)")

    if file != nil {
        // Set the data we want to write
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
        
            file?.write(jsonData)
        } catch {
            fatalError("Couldn't convert dictionary to JSON.")
        }
        

        // Close the file
        file?.closeFile()
    }
   else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
        
}
