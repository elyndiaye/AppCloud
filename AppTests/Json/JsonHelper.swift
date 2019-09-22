//
//  JsonHelper.swift
//  AppTests
//
//  Created by ely.assumpcao.ndiaye on 21/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
@testable import App

class JsonHelper {
    
    func loadJson() -> Data {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "items_v2", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        return try! Data(contentsOf: url)
    }
    
    func decodeJson() -> [Item] {
        let data = loadJson()
        let decoder = JSONDecoder()
        let items = try! decoder.decode(Return.self, from: data)
        return items.items
    }
    
}
