//
//  CarbonViewController.swift
//  fitnolPractice
//
//  Created by Muhammad Shah on 29/02/2020.
//  Copyright © 2020 Muhammad Imran Shah. All rights reserved.
//

import UIKit
import CarbonKit

class CarbonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let items = ["Courses", "Market Place", "About"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)

    }
    

}

extension CarbonViewController : CarbonTabSwipeNavigationDelegate {
    
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        let vc = UIViewController()
        switch index {
        case 0:
            vc.view.backgroundColor = .red
        case 1:
            vc.view.backgroundColor = .yellow
        case 2:
            vc.view.backgroundColor = .green
        default:
            vc.view.backgroundColor = .red
        }
        
        return vc
    }
    
     
    
}
