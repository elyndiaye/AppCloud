//
//  ItemServiceMock.swift
//  AppTests
//
//  Created by ely.assumpcao.ndiaye on 21/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

@testable import App

class ItemServiceMock: ItemService {
    
    let items: [Item]
    private let jsonHelper: JsonHelper
    
    init() {
        self.jsonHelper = JsonHelper()
        self.items = jsonHelper.decodeJson()
    }
    
    func getItens(completionHandler: @escaping ([Item]) -> Void) {
        completionHandler(self.items)
    }
}

