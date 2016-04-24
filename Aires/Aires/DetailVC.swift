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
    var timeline_id: String!
    
    override func viewDidLoad() {
        
        print(self.timeline_id)
        
        let params = [
            "timeline_id" : self.timeline_id,
            "func" : "timelineid"
        ];
        
        Alamofire.request(.GET, url, parameters: params, encoding: ParameterEncoding.URL).responseJSON { (_, _, result) in
            switch result {
            case .Success(let data):
                self.json = JSON(data)
                print(self.json)
                
                self.displayDetails()
                
            case .Failure(_, let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
    func displayDetails() {
        
        self.nameText.text = self.json["user_name"].rawString()
        
        self.createBarChart()
        
    }
    
    func createBarChart() {
        
        let barChart = PNBarChart(frame: CGRectMake(0, 470.0, self.view.frame.width, 200.0))
        barChart.animationType = .Waterfall
        
        barChart.labelMarginTop = 5.0
        barChart.xLabels = ["cough", "breath", "wheezing", "sneezing", "nasal", "itchy eyes"]
        barChart.yMaxValue = 10.0
        barChart.yValues = [
            Int(self.json["cough"].rawString()!)!,
            Int(self.json["breath"].rawString()!)!,
            Int(self.json["wheezing"].rawString()!)!,
            Int(self.json["sneezing"].rawString()!)!,
            Int(self.json["nasal"].rawString()!)!,
            Int(self.json["itchyeyes"].rawString()!)!
        ]
        barChart.strokeChart()
        
        self.view.addSubview(barChart)
    }
    
}
