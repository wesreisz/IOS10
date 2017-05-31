//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Wesley Reisz on 5/31/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tile_1: UIButton!
    @IBOutlet weak var tile_2: UIButton!
    @IBOutlet weak var tile_3: UIButton!
    @IBOutlet weak var tile_4: UIButton!
    @IBOutlet weak var tile_5: UIButton!
    @IBOutlet weak var tile_6: UIButton!
    @IBOutlet weak var tile_7: UIButton!
    @IBOutlet weak var tile_8: UIButton!
    @IBOutlet weak var tile_9: UIButton!
    
    var playerXTurn = true
    
    /*
     Todo: 
     - check to see if image was already set, and ignore click
     - check to see if there is a winning combination
     - write some kind of winning logic
    */
    
    @IBAction func resetGame(_ sender: Any) {
        print("Resetting Game")
        resetBoard()
    }
    
    @IBAction func itemSelected(_ sender: Any) {
        let tileNumber = (sender as! UIButton).tag
        print("Clicked button " + String(tileNumber))
        let tile = getTile(byId: tileNumber)
        flipTile(tile)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func flipTile(_ tile:UIButton){
        var tileImageName = ""
        if playerXTurn{
            tileImageName="cross"
        }else{
            tileImageName="nought"
        }
        tile.setImage(UIImage(named: tileImageName) as UIImage?, for: .normal)
        switchPlayerTurn()
    }
    
    func resetBoard(){
        playerXTurn = true
        
        tile_1.setImage(UIImage(named: "blank") as UIImage?, for: .normal)
        tile_2.setImage(UIImage(named: "blank") as UIImage?, for: .normal)
        tile_3.setImage(UIImage(named: "blank") as UIImage?, for: .normal)
        
        tile_4.setImage(UIImage(named: "blank") as UIImage?, for: .normal)
        tile_5.setImage(UIImage(named: "blank") as UIImage?, for: .normal)
        tile_6.setImage(UIImage(named: "blank") as UIImage?, for: .normal)
        
        tile_7.setImage(UIImage(named: "blank") as UIImage?, for: .normal)
        tile_8.setImage(UIImage(named: "blank") as UIImage?, for: .normal)
        tile_9.setImage(UIImage(named: "blank") as UIImage?, for: .normal)
    }
    
    func getTile(byId:Int) -> UIButton{
        switch (byId)
        {
            case 1: return tile_1
            case 2: return tile_2
            case 3: return tile_3
            
            case 4: return tile_4
            case 5: return tile_5
            case 6: return tile_6
            
            case 7: return tile_7
            case 8: return tile_8
            case 9: return tile_9

            default: return tile_1
        }
    }

    func switchPlayerTurn(){
        if playerXTurn{
            playerXTurn = false
        }else{
            playerXTurn = true
        }
    }

}

