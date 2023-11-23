//
//  FileManager.swift
//  HighRollers
//
//  Created by Nikki Wilde on 23/11/23.
//

import UIKit

let fileName = "ResultsArray.json"

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
    }
    
    func saveDocument(contents: String) throws {
        let url = Self.documentsDirectory.appendingPathComponent(fileName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
            print("Success")
        } catch {
            print("Failed")
            
        }
    }
    
    func readDocument() throws -> Data {
        let url = Self.documentsDirectory.appendingPathComponent(fileName)
        do {
            return try Data(contentsOf: url)
        } catch {
            throw ImageDataError.readError
        }
    }
}
