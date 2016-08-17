//
//  TimelineVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/17.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class TimelineVC: UITableViewController, OnAddNewEntryDelegate {
    
    var data = [TimelineEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(goBack))
    }
    
    func goBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimelineItemCell", forIndexPath: indexPath) as! TimelineItemCell
        
        // Configure the cell...
        cell.entry = data[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addNewEntry" {
            let vc = segue.destinationViewController as! AddNewEntryVC
            
            vc.delegate = self
        }
    }
    
    func onAddNewEntry(entry: TimelineEntry) {
        data.append(entry)
        self.tableView.reloadData()
    }
}
