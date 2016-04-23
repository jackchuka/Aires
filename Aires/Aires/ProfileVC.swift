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
    var json = JSON([]);
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        self.tableview.registerNib(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "cell")

        let params = [
            "user_id" : 1,
            "func" : "timeline"
        ];
        
        Alamofire.request(.GET, url, parameters: params, encoding: ParameterEncoding.URL).responseJSON { (_, _, result) in
            switch result {
            case .Success(let data):
                self.json = JSON(data)
                print(self.json)
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
        
        print(indexPath.row)
        print(self.json)
        
        let cough = self.json[indexPath.row]["cough"].rawString()
        print (cough)
        cell.symptomname.text = "Cough"
        cell.symptomname.textColor = UIColor.blueColor()
        cell.rating.text = "Rating of \(self.json[indexPath.row]["cough"]) out of 10"
        cell.date.text = self.json[indexPath.row]["datetime"].rawString()
        //cell.coord.text = "\(self.json[indexPath.row]["latitude"].rawString()!) : \(self.json[indexPath.row]["longitude"].rawString()!)"
        return cell
        
    }
   
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("detail", sender: self)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "detail"){
            let vc: DetailVC = segue.destinationViewController as! DetailVC
        }else{
            let vc: SelectionVC = segue.destinationViewController as! SelectionVC

        }
        //vc.descriptext = descriptionsarray[currentindex]
        
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 125.0
    }
    /*
    func parse() {
        
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    let dict = jsonObj.dictionary!
                    for key in dict.keys {
    
                    }
                    print("jsonData:\(jsonObj)")
                } else {
                    print("could not get json from file, make sure that file contains valid json.")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
      
    }
*/
    @IBAction func unwindToMap(segue: UIStoryboardSegue) {

    }
    
    


   
}
