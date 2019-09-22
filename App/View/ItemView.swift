//
//  ItemView.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import UIKit

final class ItemView: UIView{
    
    lazy var search: UISearchBar = {
        let view = UISearchBar()
        return view
    }()
    
    
    lazy var table: UITableView = {
        let view = UITableView()
        view.separatorStyle = .singleLine
        return view
    }()
    
    lazy var load: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        view.color = .black
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ItemView: CodeView{
    func buildViewHierarchy() {
        //Adicionar View
        //addSubview(search)
        addSubview(table)
        addSubview(load)
        bringSubviewToFront(load)
    }
    
    func setupConstraints() {
        //Configurar Constraints
        //Snapkit
//        search.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.right.left.equalToSuperview()
//        }
        table.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.left.bottom.equalToSuperview()
        }
        
        load.snp.makeConstraints { (make) in
            make.right.left.top.bottom.equalToSuperview()
        }
     }
    
    
    func setupAdditionalConfiguration() {
        //Setup adicional
    }
    
}
