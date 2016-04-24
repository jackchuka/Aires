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
    
    let url = "http://masanoriuehara.com/api/aircheck/";
    
    let types = ["Cough", "Wheezing", "Sneezing", "Itchy Eyes"]
    let colors = []
    var json = JSON([])
    var selected: String!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        self.tableview.registerNib(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "cell")

        let params = [
            "func" : "timeline"
        ];
        
        Alamofire.request(.GET, url, parameters: params, encoding: ParameterEncoding.URL).responseJSON { (_, _, result) in
            switch result {
            case .Success(let data):
                self.json = JSON(data)
                self.tableview.reloadData()
            case .Failure(_, let error):
                print("Request failed with error: \(error)")
            }
        }
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.json.count
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : CardCell = tableView.dequeueReusableCellWithIdentifier("cell") as! CardCell
        // Configure the cell...
        
        // TODO: find worst symptom and disply
        
        let cough = self.json[indexPath.row]["cough"].rawString()!
        cell.symptomname.text = "Cough"
        cell.symptomname.textColor = UIColor.blueColor()
        cell.rating.text = "Rating of \(cough) out of 10"
        cell.date.text = self.json[indexPath.row]["datetime"].rawString()!
        cell.location.text = "\(self.json[indexPath.row]["latitude"].rawString()!) : \(self.json[indexPath.row]["longitude"].rawString()!)"
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selected = self.json[indexPath.row]["user_id"].rawString()
        self.performSegueWithIdentifier("detail", sender: self)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "detail"){
            let vc: DetailVC = segue.destinationViewController as! DetailVC
            vc.user_id = selected
        }else{
            let vc: SelectionVC = segue.destinationViewController as! SelectionVC

        }
        //vc.descriptext = descriptionsarray[currentindex]
        
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 125.0
    }
    
    @IBAction func unwindToMap(segue: UIStoryboardSegue) {

    }
    
    


   
}
