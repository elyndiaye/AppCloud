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
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "TestApp"
        self.screen.table.isHidden = true
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        screen.search.barTintColor = UIColor.mainColor()
        screen.search.tintColor = UIColor.mainDarkBlue()
        screen.search.showsCancelButton = false
        for v:UIView in screen.search.subviews.first!.subviews {
            if v.isKind(of: UITextField.classForCoder()) {
                (v as! UITextField).tintColor = UIColor.white
                (v as! UITextField).backgroundColor = UIColor.mainOrange()
            }
        }
        
        api()
        setupSearchBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("DidAppear")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("WillAppear")
        //api()
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

}

//MARK - SEARCH BAR
extension ItemViewController: UISearchBarDelegate{
    func setupSearchBar() {
        self.screen.search.delegate = self
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
        searchBar.resignFirstResponder()
        searchBar.text = ""
        screen.search.showsCancelButton = false
        self.setupTableView(with: self.items)
    }
    
    func verifyisContainsItem() -> Bool {
        return filteredItems.isEmpty
    }
}

