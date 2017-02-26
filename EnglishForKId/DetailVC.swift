//
//  DetailVC.swift
//  EnglishForKId
//
//  Created by Admin on 2/16/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    var detaiItem: DetailOfItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.title = stringTitle
        self.createDataWithName(stringTitle)
        
        self.tableView.registerClass((UITableViewCell.self), forCellReuseIdentifier: "Cell")
    }
    
    func createDataWithName(title: String){
        var path: String = ""
        if(title == "Fruits"){
            path = NSBundle.mainBundle().pathForResource("FruitsList", ofType: "plist")!
        }
        if( title == "Animals"){
            path = NSBundle.mainBundle().pathForResource("AnimalsList", ofType: "plist")!
        }
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
    
        return arrayKeys.count
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let key: String = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if detaiItem == nil{
            detaiItem = self.storyboard?.instantiateViewControllerWithIdentifier("DetailofItem") as! DetailOfItem
        }
        detaiItem.stringTitle = arrayKeys[indexPath.row] as! String
        self.navigationController?.pushViewController(detaiItem, animated: true)
    }
    
   

}
