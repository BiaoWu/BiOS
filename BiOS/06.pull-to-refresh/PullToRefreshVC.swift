//
//  PullToRefreshVC.swift
//  PullToRefresh
//
//  Created by BiaoWu on 16/8/6.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class PullToRefreshVC: UITableViewController {
    
    var data = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(refreshData), forControlEvents: UIControlEvents.ValueChanged)
        
        data.append("Bill")
        data.append("BiaoWu")
    }
    
    func refreshData() {
        NSThread(target: self, selector: #selector(loadData), object: nil).start()
    }
    
    func loadData() {
        NSThread.sleepForTimeInterval(5)
        
        data.append("\(data.count)")
        data.append("\(data.count)")
        data.append("\(data.count)")
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
}

