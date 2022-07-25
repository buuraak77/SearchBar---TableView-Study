//
//  ViewController.swift
//  SearchBar - TableView Study
//
//  Created by Burak Yılmaz on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var countries:[String] = [String]()
    var searchedCountries:[String] = [String]()
    var didSearch = false

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countries = ["Turkey","Germany","United States","United Kingdom","Netherlands","Italy","France","Korea","China"]
        
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if didSearch == true {
            return searchedCountries.count
        } else {
            return countries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        
        if didSearch == true {
            cell.textLabel?.text = self.searchedCountries[indexPath.row]
        } else {
            cell.textLabel?.text = self.countries[indexPath.row]
        }
        
        return cell
        
        
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            didSearch = false
        } else {
            didSearch = true
            searchedCountries = countries.filter({$0.lowercased().contains(searchText.lowercased())})
        }
        tableView.reloadData()
        
    }
    
}

