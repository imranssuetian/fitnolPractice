//
//  ViewController.swift
//  fitnolPractice
//
//  Created by Muhammad Shah on 29/02/2020.
//  Copyright © 2020 Muhammad Imran Shah. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var comment = String()
    var userImage = UIImage()
    var time = String()
    var likeCount = String()
    var sectionData = [cellNestedData]()
}

struct cellNestedData {
    var title = String()
    var comment = String()
    var userImage = UIImage()
    var time = String()
    var likeCount = String()
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var cellName = "CommentsTableViewCell"
    var cellName2 = "SecondCommentsTableViewCell"
    
    var time1 = "1 hour ago"
    var time2 = "3 months ago"
    var time3 = "4 minutes ago"
    var time4 = "5 hour ago "
    
    var likeCount1 = "160k Likes"
    var likeCount2 = "3k Likes"
    var likeCount3 = "400 Likes"
    var likeCount4 = "7k Likes"
    
    var quote1 = "You have to do the work yourself…"
    var quote2 = "Your fitness is 100% mental…"
    var quote3 = "You have to want it, you have to plan for it…"
    
    var quote4 = "Think of your workouts as important meetings…"
    var quote5 = "A lot of women like to be super tiny…"
    var quote6 = "Actually, I just woke up one day and decided I didn’t want to feel…"
    
    var quote7 = "Whether you’re lost, broken or lonely…"
    var quote8 = "When you want to succeed as bad as you want to breathe…"
    var quote9 = "When you want to give up…"
    
    
    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        tableView.register(UINib(nibName: cellName2, bundle: nil), forCellReuseIdentifier: cellName2)
        
        tableViewData = [
            cellData(opened: false, title: "Brandon", comment: quote1,userImage: #imageLiteral(resourceName: "image1"), time: time1,likeCount: likeCount1,sectionData: [
                cellNestedData(title: "Amith", comment: quote4, userImage: #imageLiteral(resourceName: "image5"), time: time2, likeCount: likeCount2)]),
            cellData(opened: false, title: "Smith", comment: quote2, userImage: #imageLiteral(resourceName: "image2"), time: time2,likeCount: likeCount2,sectionData: [
                cellNestedData(title: "Imran", comment: quote1, userImage: #imageLiteral(resourceName: "image6"), time: time3, likeCount: likeCount4)]),
            cellData(opened: false, title: "Marry", comment: quote3, userImage: #imageLiteral(resourceName: "image3"), time: time1,likeCount: likeCount2,sectionData: [
                cellNestedData(title: "Umer", comment: quote2, userImage: #imageLiteral(resourceName: "image7"), time: time4, likeCount: likeCount2)]),
            cellData(opened: false, title: "Shawn", comment: quote4, userImage: #imageLiteral(resourceName: "image4"), time: time1,likeCount: likeCount2,sectionData: [
                cellNestedData(title: "Maaz", comment: quote1, userImage: #imageLiteral(resourceName: "image8"), time: time2, likeCount: likeCount2)]),]
    }
}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! CommentsTableViewCell
            cell.userImageView.image = tableViewData[indexPath.section].userImage
            cell.nameLabel.text = tableViewData[indexPath.section].title
            cell.commentLabel.text = tableViewData[indexPath.section].comment
            cell.timeLabel.text = tableViewData[indexPath.section].time
            cell.likeButton.setTitle(tableViewData[indexPath.section].likeCount, for: .normal)
            return cell
        }else {
            //nested cell
            let cell = tableView.dequeueReusableCell(withIdentifier: cellName2) as! SecondCommentsTableViewCell
            cell.userImageView.image = tableViewData[indexPath.section].sectionData[dataIndex].userImage
            cell.nameLabel.text = tableViewData[indexPath.section].sectionData[dataIndex].title
            cell.timeLabel.text = tableViewData[indexPath.section].sectionData[dataIndex].time
            cell.commentLabel.text = tableViewData[indexPath.section].sectionData[dataIndex].comment
            cell.likeButton.setTitle(tableViewData[indexPath.section].sectionData[dataIndex].likeCount, for: .normal)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
    
    
}
