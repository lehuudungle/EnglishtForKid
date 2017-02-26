//
//  MasterTableVC.swift
//  EnglishForKId
//
//  Created by Admin on 2/15/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var dictList = ["Fruits":"fruits.png","Animals": "animals.jpeg"]
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("row__ddd:  \(dictList.count)")
        return dictList.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        var arrayKey = Array(dictList.keys)

        cell.textLabel?.text = arrayKey[indexPath.row]
        cell.imageView?.image = UIImage(named: dictList[arrayKey[indexPath.row]]!)
        return cell
    }
    
    // truyền dữ liệu giữa các view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowDetail"){
            let detailVC = segue.destinationViewController as! DetailVC  // khởi tạo view controller mà chúng ta chuyểnd đến
            
            let selectedRowIndex: NSIndexPath = self.tableView.indexPathForSelectedRow!// chi số mà hàng(phần) mà chúng ta chọn


            
            let selectedCell: UITableViewCell = self.tableView.cellForRowAtIndexPath(selectedRowIndex)!//lấy ra cell trong hang
            detailVC.stringTitle = selectedCell.textLabel?.text
//            detailVC.title = selectedCell.textLabel?.text   gọi cái này cũng được
        }
    }

}
