//
//  ItemTableViewDelegate.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

final class ItemTableViewDelegate: NSObject, UITableViewDelegate{
    
    let items:[Item]
    
    init(items: [Item]){
        self.items = items
    }
    
}
