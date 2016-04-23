//
//  ProfileVC.swift
//  Aires
//
//  Created by Sara Du on 4/23/16.
//  Copyright © 2016 Sara Du. All rights reserved.
//

import UIKit
import Alamofire


class ProfileVC: UIViewController {
    
    let types = ["Cough", "Wheezing", "Sneezing", "Itchy Eyes"]
    let colors = []
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        self.tableview.registerNib(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "cell")
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }

    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : CardCell = tableView.dequeueReusableCellWithIdentifier("cell") as! CardCell
        // Configure the cell...
        cell.title.text = "Cough"
        cell.title.textColor = UIColor.blueColor()
        cell.decrip.text = "Rating of 10 out of 10"
        cell.date.text = "April"
        cell.coord.text = "Irvine"
        
        return cell
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 125.0
    }
   
}
