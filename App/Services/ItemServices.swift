//
//  ItemServices.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

import Alamofire

class ItemServices {
    
    static let instance = ItemServices()
    
    var itens = [Return]()
    
    func getItens(page:Int,completionHandler: @escaping ([Item]) -> Void ) {
        Alamofire.request("\(BASE_URL)", method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response:DataResponse<Any>) in
            
            let arrayItens = [Item]()
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedItens = try decoder.decode(Return.self, from: data)
                    //print(decodedItens)
                    
                    completionHandler(decodedItens.items)
                } catch let error {
                    print(error)
                    completionHandler(arrayItens)
                    debugPrint(response.result.error as Any)
                }
            } else {
                debugPrint(response.result.error as Any)
            }
        }
    }
}
