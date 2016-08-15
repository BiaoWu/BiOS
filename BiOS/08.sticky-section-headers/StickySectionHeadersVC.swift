//
//  StickySectionHeadersVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/14.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class StickySectionHeadersVC: UITableViewController {
    
    var data = [
        "A": ["Apple", "Amy", "Andy", "Ace"],
        "B": ["Bill", "Biao"],
        "C": ["Cara", "Charles", "Chris"],
        "D": ["Dan", "Danny", "Darwin"],
        "G": ["Galen"],
        "M": ["Mac", "Mark", "Mary"],
        "W": ["Walton"],
        ]
    
    var sortedKeys: Array<String>!
    
    override func viewDidLoad() {
        sortedKeys = data.keys.sort()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sortedKeys.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data[getSectionKey(section)]?.count)!
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = data[getSectionKey(indexPath.section)]?[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let str = data[getSectionKey(section)]![0]
        let char = str[str.startIndex]
        return String(char)
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return sortedKeys
    }
    
    private func getSectionKey(section: Int) -> String {
        return sortedKeys[sortedKeys.startIndex.advancedBy(section)]
    }
}
