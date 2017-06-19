//
//  DetailViewController.swift
//  Blog Reader
//
//  Created by Wesley Reisz on 6/17/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailTimeStampLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let timeLabel = detailTimeStampLabel {
                timeLabel.text = detail.timestamp!.description
            }
            if let title = titleLabel{
                title.text = detail.title
            }
            if let description = detailDescriptionLabel{
                description.text = detail.eventDescription
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

