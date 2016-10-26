//
//  ContactsVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/16.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class ContactsVC: UITableViewController, AddNewUserListener {
    fileprivate let cellStr = "ContactsItemCell"
    
    var model = ContactsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
    }
    
    func addNewItem() {
       let vc =  UIStoryboard(name: "contacts-app", bundle: nil).instantiateViewController(withIdentifier: "AddNewUserVC") as! AddNewUserVC
        vc.addNewUserListener = self
        self.show(vc, sender: nil)
    }
    
    func onAddNewUser(_ user: User) {
        model.addNewUser(user)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellStr, for: indexPath) as! ContactsItemCell
        
        cell.user = model.getItem((indexPath as NSIndexPath).section, (indexPath as NSIndexPath).row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.titleForHeaderInSection(section)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserInfo" {
            let vc = segue.destination as! UserInfoVC
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                vc.user = model.getItem((indexPath as NSIndexPath).section, (indexPath as NSIndexPath).row)!
            }
            
        }
    }
}
