//
//  MainViewController.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/9.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    var model = MainModel()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.size()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        cell.textLabel?.text = model.getItem(indexPath.row).title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        showViewController(model.providerVc(indexPath.row), sender: nil)
    }
}

