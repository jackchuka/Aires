//
//  GraphsVC.swift
//  Aires
//
//  Created by Sara Du on 4/23/16.
//  Copyright © 2016 Sara Du. All rights reserved.
//

import UIKit
import SwiftCharts


class GraphsVC: UIViewController {
    var currentExampleController: UIViewController?

    override func viewDidLoad() {
        self.showExampleController(BubbleExample())
    }
    private func showExampleController(controller: UIViewController) {
        if let currentExampleController = self.currentExampleController {
            currentExampleController.removeFromParentViewController()
            currentExampleController.view.removeFromSuperview()
        }
        self.addChildViewController(controller)
        self.view.addSubview(controller.view)
        self.currentExampleController = controller
    }

}
