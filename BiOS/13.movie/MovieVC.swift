//
//  MovieVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/23.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class MovieVC: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate {
    
    var movies = [
        "The Angry Birds",
        "Black Mass",
        "Inside Out",
        ]
    
    var data: [String]!
    
    var searchVC: UISearchController!
    
    var searchText: String? {
        willSet {
            if newValue != nil && newValue != searchText {
                reload(newValue!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Movies"
        searchText = ""
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: #selector(beginSearch))
        
        searchVC = UISearchController(searchResultsController: nil)
        searchVC.searchResultsUpdater = self
        searchVC.dimsBackgroundDuringPresentation = false
        
        searchVC.delegate = self
    }
    
    func beginSearch() {
        self.tableView.tableHeaderView = searchVC.searchBar
        searchVC.searchBar.becomeFirstResponder()
    }
    
    func reload(text: String) {
        if text == "" {
            data = movies
        } else {
            let searchPredicate = NSPredicate(format: "SELF CONTAINS[c]%@", text)
            data = (movies as NSArray).filteredArrayUsingPredicate(searchPredicate) as! [String]
        }
        self.tableView.reloadData()
    }
    
    // MARK: - UISearchControllerDelegate
    
    func willDismissSearchController(searchController: UISearchController) {
        self.tableView.tableHeaderView = nil
    }
    
    // MARK: - UISearchResultsUpdating
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print("searchController.searchBar.text = \(searchController.searchBar.text)")
        searchText = searchController.searchBar.text
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
}
