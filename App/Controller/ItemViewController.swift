//
//  ViewController.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    var items = [Item]()
    var filteredItems = [Item]()
    let pageCount = 1
    var inSearchMode = false
    var searchBar: UISearchBar!
    
    var tableViewDataSource: ItemTableViewDataSource?
    var tableViewDelegate: ItemTableViewDelegate?
    
    let screen = ItemView()
    
    override func loadView() {
        super.loadView()
        self.view = screen
        //screen.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        self.screen.table.isHidden = true
        api()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    // MARK: - API Services
    func api(){
        ItemServices.instance.getItens(page: pageCount){ [weak self] items in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.items.append(contentsOf: items)
                if self.items.count >= 1 {
                    self.screen.table.isHidden = false
                    self.setupTableView(with: self.items)
                } else {
                    self.screen.table.isHidden = true
                }
            }
        }
    }
    
    //MARK: - SetupTableView
    func setupTableView(with item:[Item]){
        tableViewDataSource = ItemTableViewDataSource(items: item, tableView: screen.table)
        tableViewDelegate = ItemTableViewDelegate(items: item)
        
        screen.table.dataSource = tableViewDataSource
        screen.table.delegate = tableViewDelegate
        screen.table.reloadData()
    }
    
    //Mark: - Selectors
    @objc func showSearchBar(){
        configureSearchBar(shouldShow: true)
    }
    
    func configureSearchBar(shouldShow: Bool) {
        
        if shouldShow {
            searchBar = UISearchBar()
            searchBar.delegate = self
            searchBar.sizeToFit()
            searchBar.showsCancelButton = true
            searchBar.becomeFirstResponder()
            searchBar.tintColor = .black
            
            navigationItem.rightBarButtonItem = nil
            navigationItem.titleView = searchBar
        } else {
            navigationItem.titleView = nil
            configureSearchBarButton()
            inSearchMode = false
            self.setupTableView(with: self.items)
        }
    }
    
    func configureSearchBarButton() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
    navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
}

//MARK - SEARCH BAR
extension ItemViewController: UISearchBarDelegate { 
    func setupSearchBar() {
        self.screen.search.delegate = self
        //screen.search.sizeToFit()
        screen.search.sizeToFit()
        screen.search.showsCancelButton = true
        screen.search.becomeFirstResponder()
        screen.search.tintColor = .black
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = screen.search
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        screen.search.resignFirstResponder()
        let query = searchBar.text ?? ""
        if !query.isEmpty {
            print(query)
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            inSearchMode = false
            self.setupTableView(with: self.items)
            view.endEditing(true)
        } else {
            screen.search.showsCancelButton = true
            screen.search.sizeToFit()
            inSearchMode = true
            print(searchText)
            filteredItems = items.filter({ $0.title.lowercased().range(of: searchText.lowercased()) != nil })
            if verifyisContainsItem(){
                EmptyTextField(text: "Not Found", message: "Item not found in the list, please try again !")
                self.setupTableView(with: self.items)
                return
            }
            self.setupTableView(with: self.filteredItems)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        configureSearchBar(shouldShow: false)
    }
    
    func verifyisContainsItem() -> Bool {
        return filteredItems.isEmpty
    }
}

