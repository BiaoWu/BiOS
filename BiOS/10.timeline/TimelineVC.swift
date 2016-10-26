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
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(goBack))
    }
    
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineItemCell", for: indexPath) as! TimelineItemCell
        
        // Configure the cell...
        cell.entry = data[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewEntry" {
            let vc = segue.destination as! AddNewEntryVC
            
            vc.delegate = self
        }
    }
    
    func onAddNewEntry(_ entry: TimelineEntry) {
        data.append(entry)
        self.tableView.reloadData()
    }
}
