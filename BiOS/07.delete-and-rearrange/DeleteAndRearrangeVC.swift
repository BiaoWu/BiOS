//
//  DeleteAndRearrangeVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/13.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class DeleteAndRearrangeVC: UITableViewController {
    
    var data = [
        "Amy",
        "Biao",
        "Bill",
        "Charles",
        "David",
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //编辑按钮
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    // 处理删除回调
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.data.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    // 能够移动的item
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        let rowData = data[indexPath.row]
        
        return rowData.hasPrefix("B")
    }
    
    // 移动后数据处理
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let moveObject  = self.data[sourceIndexPath.row]
        self.data.removeAtIndex(sourceIndexPath.row)
        
        self.data.insert(moveObject, atIndex: destinationIndexPath.row)
        print("\(sourceIndexPath.row) => \(destinationIndexPath.row)")
    }
}
