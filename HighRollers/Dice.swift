//
//  Dice.swift
//  HighRollers
//
//  Created by Nikki Wilde on 22/11/23.
//

import Foundation

struct Dice {
    var sides: Int
}

class Result: Codable {
    var id = UUID()
    var result: [Int]
    
    init(id: UUID = UUID(), result: [Int]) {
        self.id = id
        self.result = result
    }
}

class ResultsArray {
    @Published var resultArray = [Result]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(resultArray) {
                try? FileManager().saveDocument(contents: fileName)
            }
        }
    }
    
    init() {
        do {
            let data = try FileManager().readDocument()
            let decoder = JSONDecoder()
            do {
                if let decoded = try? decoder.decode([Result].self, from: data)  {
                    resultArray = decoded
                    return
                }
            }
        } catch {
            print("Error Initializing")
        }
        self.resultArray = resultArray
        resultArray = []
    }
    
    
}
