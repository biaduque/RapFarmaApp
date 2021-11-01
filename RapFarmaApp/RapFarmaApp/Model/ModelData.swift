//
//  ModelData.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 01/11/21.
//

import Foundation

func loadJson(filename fileName: String) -> [Farmacias]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            return jsonData.Farmacias
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

let farmaciasData = loadJson(filename: "remedios")!

