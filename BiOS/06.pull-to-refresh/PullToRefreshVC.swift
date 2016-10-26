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
        
        self.refreshControl?.addTarget(self, action: #selector(refreshData), for: UIControlEvents.valueChanged)
        
        data.append("Bill")
        data.append("BiaoWu")
    }
    
    func refreshData() {
        Thread(target: self, selector: #selector(loadData), object: nil).start()
    }
    
    func loadData() {
        Thread.sleep(forTimeInterval: 5)
        
        data.append("\(data.count)")
        data.append("\(data.count)")
        data.append("\(data.count)")
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[(indexPath as NSIndexPath).row]
        
        return cell
    }
}

