//
//  SecondCommentsTableViewCell.swift
//  fitnolPractice
//
//  Created by Muhammad Shah on 29/02/2020.
//  Copyright © 2020 Muhammad Imran Shah. All rights reserved.
//

import UIKit

class SecondCommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userImageView.layer.cornerRadius = self.userImageView.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
