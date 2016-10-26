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
        sortedKeys = data.keys.sorted()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedKeys.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data[getSectionKey(section)]?.count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[getSectionKey((indexPath as NSIndexPath).section)]?[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let str = data[getSectionKey(section)]![0]
        let char = str[str.startIndex]
        return String(char)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedKeys
    }
    
    fileprivate func getSectionKey(_ section: Int) -> String {
        return sortedKeys[sortedKeys.startIndex.advanced(by: section)]
    }
}
