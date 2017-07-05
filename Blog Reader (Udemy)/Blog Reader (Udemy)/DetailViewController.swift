//
//  DetailViewController.swift
//  Blog Reader (Udemy)
//
//  Created by Wesley Reisz on 6/20/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let webviewTitle = detail.title{
                self.title = webviewTitle
            }else{
                self.title = "Article Title"
            }
            
            if let blogWebView = self.webview {
                blogWebView.loadHTMLString(detail.content!, baseURL: nil)
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

