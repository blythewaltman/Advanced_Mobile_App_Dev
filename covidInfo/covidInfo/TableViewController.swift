//
//  TableViewController.swift
//  covidInfo
//
//  Created by Blythe Waltman on 3/6/21.
//
// Search Controller related code from tutorial - https://www.raywenderlich.com/4363809-uisearchcontroller-tutorial-getting-started
//

import UIKit

class TableViewController: UITableViewController {
    
    var nameDataHandler = NameDataHandler()
    
    var names : [String] = []
    let searchController = UISearchController(searchResultsController: nil)
    var filteredNames : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the api data to get the country names
        nameDataHandler.onDataUpdate = {[weak self] (data:[String]) in self?.render()}
        nameDataHandler.loadjson()

        //Search bar implementation - https://www.raywenderlich.com/4363809-uisearchcontroller-tutorial-getting-started
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Countries"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
        
    func render() {
        names = nameDataHandler.getNames()
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return filteredNames.count
        }
        return names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name : String
        if isFiltering{
            name = filteredNames[indexPath.row]
        }
        else{
            name = names[indexPath.row]
        }
        cell.textLabel!.text = name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
          segue.identifier == "covidIdentifier",
          let indexPath = tableView.indexPathForSelectedRow,
          let detailViewController = segue.destination as? DetailViewController
          else {
            return
        }
        
        let name : String
        if isFiltering{
            name = filteredNames[indexPath.row]
        }
        else{
            name = names[indexPath.row]
        }
        detailViewController.country = name
        detailViewController.title = name
    }
    
    var isSearchBarEmpty: Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
      filteredNames = names.filter { (name: String) -> Bool in
        return name.lowercased().contains(searchText.lowercased())
      }
      tableView.reloadData()
    }

    var isFiltering : Bool{
        return searchController.isActive && !isSearchBarEmpty
    }
}

extension TableViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
