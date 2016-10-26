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
        // Add New Button
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddView))
        //编辑按钮
        self.navigationItem.rightBarButtonItems = [addButton, self.editButtonItem]
    }
    
    // Alert
    func showAddView() {
        let alert =  UIAlertController(title: "Add New", message: "please enter a new name", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_) -> Void
            in
            
            let textField = alert.textFields!.first!
            if textField.text != "" {
                self.data.append(textField.text!)
                self.tableView.reloadData()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: nil)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = data[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    // 处理删除回调
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.data.remove(at: (indexPath as NSIndexPath).row)
            self.tableView.reloadData()
        }
    }
    
    // 能够移动的item
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        let rowData = data[(indexPath as NSIndexPath).row]
        
        return rowData.hasPrefix("B")
    }
    
    // 移动后数据处理
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let moveObject  = self.data[(sourceIndexPath as NSIndexPath).row]
        self.data.remove(at: (sourceIndexPath as NSIndexPath).row)
        
        self.data.insert(moveObject, at: (destinationIndexPath as NSIndexPath).row)
        print("\((sourceIndexPath as NSIndexPath).row) => \((destinationIndexPath as NSIndexPath).row)")
    }
}
