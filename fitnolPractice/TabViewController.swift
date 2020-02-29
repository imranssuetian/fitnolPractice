//
//  TabViewController.swift
//  fitnolPractice
//
//  Created by Muhammad Shah on 29/02/2020.
//  Copyright © 2020 Muhammad Imran Shah. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {
    
    
    private var viewControllers = [UIViewController(), UIViewController()]
    
    let tabBar = TMBar.TabBar()
    let tabBarView = TMBarView()
    let barButton = TMBar.ButtonBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Fitnol Customization
        
        
        
        dataSource = self

        // Customization
        print(barButton.backgroundView.frame.width)
        
        barButton.layout.contentInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 4.0, right: 16.0)
        barButton.layout.interButtonSpacing = 24.0
        barButton.indicator.weight = .light
        barButton.indicator.cornerStyle = .rounded
        barButton.indicator.backgroundColor = .yellow
        barButton.fadesContentEdges = true
        barButton.spacing = 16.0
        
        // Add a '+' button the trailing end of the bar to insert more pages.
//        let plusButton = CircularBarActionButton(action: .add)
//        plusButton.addTarget(self, action: #selector(insertPage(_:)), for: .touchUpInside)
//        plusButton.tintColor = .white
//        bar.rightAccessoryView = plusButton
        
        // Add the bar to the view controller - wrapping it in a `TMSystemBar`.
        addBar(barButton.systemBar(),
               dataSource: self,
               at: .top)
    }
    

}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let titles = ["Courses","Market Place"]
        let title = titles[index]
        return TMBarItem(title: title)
    }

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        
        let vcs  = viewControllers[index]
        switch index {
        case 0:
            vcs.view.backgroundColor = .red
        case 1:
            vcs.view.backgroundColor = .yellow
        case 2:
            vcs.view.backgroundColor = .green
        default:
            vcs.view.backgroundColor = .red
        }
        return vcs
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for tabViewController: TabmanViewController, at index: Int) -> TMBarItemable {
        let title = "Page \(index)"
        return TMBarItem(title: title)
    }
}
