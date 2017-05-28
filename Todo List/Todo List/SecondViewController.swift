//
//  SecondViewController.swift
//  Todo List
//
//  Created by Wesley Reisz on 5/28/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var itemList = [String]()
    
    @IBOutlet weak var txtItem2Add: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBAction func addItemClicked(_ sender: Any) {
        guard let itemText = txtItem2Add.text else{
            lblMessage.text = "Please Enter a Value"
            return
        }
        itemList.append(itemText)
        txtItem2Add.text = ""
        UserDefaults.standard.set(itemList, forKey: "items")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        lblMessage.text = ""
        
        let itemsObject = UserDefaults.standard.stringArray(forKey: "items")
        
        if itemsObject != nil {
            itemList = itemsObject!
        }


    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

