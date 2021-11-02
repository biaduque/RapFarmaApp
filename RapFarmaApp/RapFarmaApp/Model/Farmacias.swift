//
//  Remedios.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 01/11/21.
//

import Foundation

struct ResponseData: Decodable {
    var Farmacias: [Farmacias]
}

struct Farmacias: Decodable{
    var Farmacia: String
    var Distancia: String
    var Endereco: String
    var Rating: Int
    var Catalogo: [Catalogo]
    
    struct Catalogo: Decodable{
        var Remedio: String
        var Dosagem: String
        var Quantidade: String
        var Indicacao: String
        var Preco: String
        var Imagem: String
        
    }
}
