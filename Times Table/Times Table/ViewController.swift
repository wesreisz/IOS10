//
//  ViewController.swift
//  Times Table
//
//  Created by Wesley Reisz on 5/25/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let count: Int = 50
    var currentSelectedValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var table: UITableView!
    
    @IBAction func sliderChanged(_ sender: Any) {
        calculateResult()
        print("slider changed: " + String(currentSelectedValue))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calculateResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        let i = (indexPath.row + 1)
        let result = i * currentSelectedValue
        cell.textLabel?.text = "\(String(i)) X \(String(currentSelectedValue)) = \(result)"
        return cell
    }
    
    internal func calculateResult(){
        currentSelectedValue = Int((slider.value * 10))
        table.reloadData()
    }

}

