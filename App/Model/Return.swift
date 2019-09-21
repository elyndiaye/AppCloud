//
//  Return.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
//   let return = try? newJSONDecoder().decode(Return.self, from: jsonData)

// MARK: - Return
struct Return: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let title, itemDescription: String
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case itemDescription = "description"
        case imageURL = "imageUrl"
    }
}
