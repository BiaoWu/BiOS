//
//  ContactsVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/16.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class ContactsVC: UITableViewController, AddNewUserListener {
    private let cellStr = "ContactsItemCell"
    
    var model = ContactsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addNewItem))
    }
    
    func addNewItem() {
       let vc =  UIStoryboard(name: "contacts-app", bundle: nil).instantiateViewControllerWithIdentifier("AddNewUserVC") as! AddNewUserVC
        vc.addNewUserListener = self
        self.showViewController(vc, sender: nil)
    }
    
    func onAddNewUser(user: User) {
        model.addNewUser(user)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return model.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRowsInSection(section)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellStr, forIndexPath: indexPath) as! ContactsItemCell
        
        cell.user = model.getItem(indexPath.section, indexPath.row)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.titleForHeaderInSection(section)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showUserInfo" {
            let vc = segue.destinationViewController as! UserInfoVC
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                vc.user = model.getItem(indexPath.section, indexPath.row)!
            }
            
        }
    }
}
