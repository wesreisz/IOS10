//
//  BlogPostTableViewCell.swift
//  Blog Reader
//
//  Created by Wesley Reisz on 6/17/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class BlogPostTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
