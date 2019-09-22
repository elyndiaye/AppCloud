//
//  ItemTableViewDelegate.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

final class ItemTableViewDelegate: NSObject, UITableViewDelegate{
    weak var delegate: ItemSelectionDelegate?
    let items:[Item]
    
    init(items: [Item], delegate: ItemSelectionDelegate){
        self.items = items
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemCell = items[indexPath.row]
        delegate?.didSelect(item: itemCell)
    }
    
}
