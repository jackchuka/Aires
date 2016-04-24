//
//  CardCell.swift
//  Aires
//
//  Created by Sara Du on 4/23/16.
//  Copyright © 2016 Sara Du. All rights reserved.
//
import Foundation
import Foundation
import UIKit
class CardCell: UITableViewCell{
    
    @IBOutlet var rating: UILabel!
    @IBOutlet var symptomname: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var location: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
