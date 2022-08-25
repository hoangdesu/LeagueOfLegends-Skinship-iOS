//
//  ModelData.swift
//  LeagueOfLegends-Skinship
//
//  Created by ドロケ on 25/08/2022.
//

import Foundation

func decodeJsonFromFile(jsonFileName: String) -> [Champion] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Champion].self, from: data)
//                print(decoded)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Champion]
}


//print(champions)


