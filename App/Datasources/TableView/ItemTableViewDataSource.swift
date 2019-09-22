//
//  ItemTableViewDataSource.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

final class ItemTableViewDataSource: NSObject, UITableViewDataSource{
    var items:[Item]
    
    init(items: [Item], tableView: UITableView){
        self.items = items
        super.init()
        setupTableView(tableView)
    }
    
    private func setupTableView(_ tableView: UITableView) {
        tableView.register(cellType: ItemCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath,
                                                 cellType: ItemCell.self)
        let item = items[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
}
