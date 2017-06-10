//
//  PlacesViewController.swift
//  Memorable Places
//
//  Created by Wesley Reisz on 6/10/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class PlacesViewController: UITableViewController  {
    
    var rowNumberPressed:Int = 0
    var loadPlace = false
    var places = [Place]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadPlace = false
        places = UserDefaultUtil.loadPlaces()
        print(places)
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        places = UserDefaultUtil.loadPlaces()
        tableView.reloadData()
    }
    
    @IBAction func addNewLocationClicked(_ sender: Any) {
        loadPlace = false
    }
    
    @IBAction func clearPlacesClicked(_ sender: Any) {
        loadPlace = false
        UserDefaultUtil.flushCache()
        places = UserDefaultUtil.loadPlaces()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="segueToMap" && loadPlace){
            var viewController = segue.destination as! ViewController
            viewController.place2load = places[rowNumberPressed]
        }
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
            print("places count: \(places.count)")
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowNumberPressed = indexPath.row
        loadPlace = true
        performSegue(withIdentifier: "segueToMap", sender: self)    }

}
