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
    
    var playerTurn:Player = Player.PLAYER_X
    var gameBoard = [Player](repeating: Player.NOT_SELECTED, count: 9)
    var moves: Int = 0
    
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
        updateGameBoard(tileNumber,playerTurn)
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
    
    func updateGameBoard(_ tileNumber: Int, _ player: Player){
        if gameBoard[tileNumber-1]==Player.NOT_SELECTED{
            gameBoard[tileNumber-1]=player
            flipTile(tileNumber)
            print(gameBoard)
            moves += 1
            
            checkGameBoardForWins()
            status()
        }
    }
    
    func status(){
        print("---------------------------")
        print("Moves: " + String(moves))
        print("---------------------------")
    }
    
    func flipTile(_ tileNumber:Int){
        var tileImageName = ""
        let tile = getTile(byId: tileNumber)
        if playerTurn==Player.PLAYER_X{
            tileImageName="cross"
        }else{
            tileImageName="nought"
        }
        tile.setImage(UIImage(named: tileImageName) as UIImage?, for: .normal)
        switchPlayerTurn()
    }
    
    func checkGameBoardForWins(){
        var winningCombinations = [[Int]]()
        
        //across
        winningCombinations.append([1,2,3])
        winningCombinations.append([4,5,6])
        winningCombinations.append([7,8,9])
        
        //down
        winningCombinations.append([1,4,7])
        winningCombinations.append([2,5,8])
        winningCombinations.append([3,6,9])
        
        //diagonal
        winningCombinations.append([1,5,9])
        winningCombinations.append([3,5,7])
        
        for winningCombination in winningCombinations{
            print("Combination: ")
            print(" -" + gameBoard[winningCombination[0]-1].description())
            print(" -" + gameBoard[winningCombination[1]-1].description())
            print(" -" + gameBoard[winningCombination[2]-1].description())
            
            if compareCombinations(gameBoard[winningCombination[0]-1], gameBoard[winningCombination[1]-1], gameBoard[winningCombination[2]-1]){
                runWinner(winningPlayer: gameBoard[winningCombination[1]-1])
            }
            
        }
        
        if moves>=9{
            runDraw()
        }
    }
    
    func compareCombinations(_ val1: Player, _ val2: Player, _ val3: Player) -> Bool{
        if val1==Player.NOT_SELECTED || val2==Player.NOT_SELECTED || val3 == Player.NOT_SELECTED{
            return false
        }
        
        if val1==val2{
            if val2==val3{
                return true
            }
        }
        
        return false
    }
    
    func runDraw(){
        print("Draw")
        enableGameBoard(false)
        
        let alert = UIAlertController(title: "Game Over", message: "This one was a draw", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func runWinner(winningPlayer: Player){
        print("Winner" + winningPlayer.description())
        enableGameBoard(false)
        
        let alert = UIAlertController(title: "Game Over", message: winningPlayer.description() + " Wins!!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetBoard(){
        moves = 0
        gameBoard = [Player](repeating: Player.NOT_SELECTED, count: 9)
        enableGameBoard(true)
        playerTurn=Player.PLAYER_X
        
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
        if playerTurn==Player.PLAYER_X{
            playerTurn = Player.PLAYER_Y
        }else{
            playerTurn = Player.PLAYER_X
        }
    }
    
    func enableGameBoard(_ val: Bool){
        if val{
            tile_1.isUserInteractionEnabled=true
            tile_2.isUserInteractionEnabled=true
            tile_3.isUserInteractionEnabled=true
            
            tile_4.isUserInteractionEnabled=true
            tile_5.isUserInteractionEnabled=true
            tile_6.isUserInteractionEnabled=true
            
            tile_7.isUserInteractionEnabled=true
            tile_8.isUserInteractionEnabled=true
            tile_9.isUserInteractionEnabled=true
        }else{
            tile_1.isUserInteractionEnabled=false
            tile_2.isUserInteractionEnabled=false
            tile_3.isUserInteractionEnabled=false
            
            tile_4.isUserInteractionEnabled=false
            tile_5.isUserInteractionEnabled=false
            tile_6.isUserInteractionEnabled=false
            
            tile_7.isUserInteractionEnabled=false
            tile_8.isUserInteractionEnabled=false
            tile_9.isUserInteractionEnabled=false
        }
    }

}

enum Player {
    case PLAYER_X
    case PLAYER_Y
    case NOT_SELECTED
    
    func description() -> String{
        if Player.PLAYER_X==self{
            return "Player X"
        }else if Player.PLAYER_Y==self{
            return "Player O"
        }else{
            return "Not Played"
        }
    }
}

