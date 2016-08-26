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
    
    let imageArray = [
        UIImage(named: "avatar 1"),
        UIImage(named: "avatar 4"),
        UIImage(named: "avatar 3")
    ]
    
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
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        setUpSearchBar()
    }
    
    func setUpSearchBar() {
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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return data.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("banner") as? MovieBannerCell ?? MovieBannerCell(style: .Default, reuseIdentifier: "banner")
            
            cell.images = imageArray
            
            return cell
        default:
            print("\(indexPath.row)")
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            
            cell.textLabel?.text = data[indexPath.row]
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        default:
            return 50
        }
    }
    
}
