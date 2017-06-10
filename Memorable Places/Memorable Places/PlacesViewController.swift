//
//  PlacesViewController.swift
//  Memorable Places
//
//  Created by Wesley Reisz on 6/10/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class PlacesViewController: UITableViewController  {
    
    var places = [Place]()

    override func viewDidLoad() {
        super.viewDidLoad()

        places = UserDefaultUtil.loadPlaces()
        print(places)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return places.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = places[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            places.remove(at: indexPath.row)
            UserDefaultUtil.savePlaces(places)
            tableView.reloadData()
        }
    }

}
