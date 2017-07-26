//
//  ViewController.swift
//  Instagram Clone
//
//  Created by Wesley Reisz on 7/25/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    //todo:
    // correctly lazy load variable after first load
    // on view did load populate that value
    // display on tableview
    // on send do an update
    // validate the input field for 140 characters
    
    //left off here: https://www.udemy.com/complete-ios-11-developer-course/learn/v4/t/lecture/7284604?start=0 at 11:30
    
    
    @IBOutlet weak var txtMessageField: UITextField!
    
    lazy var messageArray:[PFObject]

    override func viewDidLoad() {
        super.viewDidLoad()

        let query = PFQuery(className: "Messages")
        query.whereKey("name", equalTo: "Wesley Reisz")
        
        do{
            try messageArray = query.findObjects()
        }catch{
            print("Parse Query failed")
        }
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "placeholder"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        if let value = txtMessageField.text{
            let messages = PFObject(className: "Messages")
            messages["messageBody"] = value
            messages["name"] = "Wesley Reisz"
            messages["timestamp"] = NSDate()
            messages.saveInBackground(block: { (success, error) in
                let alert = UIAlertController(title: "Send", message: "Message sent", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

