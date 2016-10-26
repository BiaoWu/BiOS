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
        MovieEntry("The Angry Birds", "avatar 1"),
        MovieEntry("Black Mass", "avatar 4"),
        MovieEntry("Inside Out", "avatar 3"),
        ]
    
    var data: [MovieEntry]!
    
    let bannerImageArray = [
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
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        setUpSearchBar()
    }
    
    func setUpSearchBar() {
        searchText = ""
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(beginSearch))
        
        searchVC = UISearchController(searchResultsController: nil)
        searchVC.searchResultsUpdater = self
        searchVC.dimsBackgroundDuringPresentation = false
        
        searchVC.delegate = self
    }
    
    func beginSearch() {
        self.tableView.tableHeaderView = searchVC.searchBar
        searchVC.searchBar.becomeFirstResponder()
    }
    
    func reload(_ text: String) {
        if text == "" {
            data = movies
        } else {
            data = movies.filter() {
                return $0.title.localizedStandardContains(text)
            }
        }
        self.tableView.reloadData()
    }
    
    // MARK: - UISearchControllerDelegate
    
    func willDismissSearchController(_ searchController: UISearchController) {
        self.tableView.tableHeaderView = nil
    }
    
    // MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        print("searchController.searchBar.text = \(searchController.searchBar.text)")
        searchText = searchController.searchBar.text
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return data.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath as NSIndexPath).section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "banner") as? MovieBannerCell ?? MovieBannerCell(style: .default, reuseIdentifier: "banner")
            
            cell.images = bannerImageArray
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ID_MovieItemCell) as? MovieItemCell ?? MovieItemCell()
            
            cell.titleLabel.text = data[(indexPath as NSIndexPath).row].title
            cell.coverImageView.image = UIImage(named: data[(indexPath as NSIndexPath).row].imageName)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath as NSIndexPath).section {
        case 0:
            return 200
        default:
            return 150
        }
    }
    
}
