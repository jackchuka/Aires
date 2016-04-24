//
//  DetailVC.swift
//  Aires
//
//  Created by Sara Du on 4/23/16.
//  Copyright © 2016 Sara Du. All rights reserved.
//

import UIKit
import Alamofire
import PNChartSwift

class DetailVC: UIViewController {
    
    @IBOutlet weak var nameText: UILabel!
    
    let url = "http://masanoriuehara.com/api/aircheck/";
    
    var json = JSON([])
    var user_id: String!
    
    override func viewDidLoad() {
        
        print(self.user_id)
        
        let params = [
            "user_id" : self.user_id,
            "func" : "userTimeline",
            "limit" : 1
        ];
        
        Alamofire.request(.GET, url, parameters: params as? [String : AnyObject], encoding: ParameterEncoding.URL).responseJSON { (_, _, result) in
            switch result {
            case .Success(let data):
                self.json = JSON(data)
                
                self.displayDetails()
                
            case .Failure(_, let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
    func displayDetails() {
        
        self.nameText.text = self.json[0]["user_name"].rawString()
        
        self.createBarChart()
        
    }
    
    func createBarChart() {
        
    }
    
}
