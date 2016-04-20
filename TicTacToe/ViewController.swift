//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sean Daniel on 2016-03-31.
//  Copyright © 2016 SeanDaniel.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1 = x, 2 = y
    
    var gameOver = false
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],  [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var rematchButton: UIButton!
    
    @IBAction func Rematch(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

        activePlayer = 1
        
        gameOver = false
        
        resultLabel.text = ""
        
        rematchButton.hidden = true
        
        rematchButton.center = CGPointMake(rematchButton.center.x - 500, rematchButton.center.y)
        
        resultLabel.hidden = true
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 500, resultLabel.center.y)
        
        var buttonToClear = UIButton()
        
        for var i = 1; i <= 9; i += 1 {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
    }
    
    
    @IBOutlet weak var button: UIButton!

    @IBAction func buttonPressed(sender: AnyObject) {

        if !gameOver {
            
            if gameState[sender.tag - 1 ] == 0 {
                
                gameState[sender.tag - 1] = activePlayer
            
                if activePlayer == 1 {
                    
                    sender.setImage(UIImage(named: "x.png"), forState: .Normal)
                    
                    activePlayer = 2
                    
                    
                } else {
                    
                    sender.setImage(UIImage(named: "o.png"), forState: .Normal)
                    
                    activePlayer = 1
                    
                }
                
                for combos in winningCombos {
                    
                    if gameState[combos[0] - 1 ] != 0 && gameState[combos[0] - 1] == gameState[combos[1] - 1 ] && gameState[combos[1] - 1] == gameState[combos[2] - 1] {
                        
                        gameOver = true
                        
                        if gameState[combos[0] - 1] == 1 {
                            
                            resultLabel.text = "X has won!"
                            
                        } else {
                            
                            resultLabel.text = "O has won!"
                            
                        }
                        
                        endGame()
                        
                    }
                    
                    if !gameOver {
                    
                        gameOver = true
                    
                        for buttonState in gameState {
                            
                            if buttonState == 0 {
                            
                                gameOver = false
                                
                            }
                            
                        }
                        
                        if gameOver {
                                
                            resultLabel.text = "Cats game..."
                                
                            endGame()
                            
                        }
                        
                    }
                    
                }
            
            }
            
        }
        
    }
    
    func endGame() {
        
        // Animate in the winner and rematch button
        
        resultLabel.hidden = false
        
        rematchButton.hidden = false
        
        UIView.animateWithDuration(0.5, animations: {
            
            self.resultLabel.center = CGPointMake(self.resultLabel.center.x, self.resultLabel.center.y - 500)
            
            self.rematchButton.center = CGPointMake(self.rematchButton.center.x, self.rematchButton.center.y - 500)
        
        })
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.hidden = true
        
        resultLabel.center = CGPointMake(resultLabel.center.x, resultLabel.center.y + 500)
        
        rematchButton.hidden = true
        
        rematchButton.center = CGPointMake(rematchButton.center.x, rematchButton.center.y + 500)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

