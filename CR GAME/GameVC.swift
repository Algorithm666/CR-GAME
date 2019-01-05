//
//  GameVC.swift
//  CR GAME
//
//  Created by Yusif Huseynov on 1/2/19.
//  Copyright © 2019 Yusif Huseynov. All rights reserved.
//

import UIKit

//Colors array
let myColors: [String: UIColor] = [
    "Black": .black,
    "Green": .green,
    "Yellow": .yellow,
    "Red": .red,
    "Blue": .blue,
    "Orange": .orange
]

//Score and timer
var score = 0
var timer = Timer()
var counter = 60



//Random color picking
var finalColor=myColors[randomColor()]
var finalText=randomColor()

func randomColor()->String{
    
    let coloursArray = ["Black","Green","Yellow","Red","Blue","Orange"]
    
    let randomIndex = Int(arc4random_uniform(UInt32(coloursArray.count)))
    
    let randomColour = coloursArray[randomIndex]
    
    return randomColour
}



class GameVC: UIViewController {
    

    


    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var colourLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer.invalidate()
        
        counter = 60
        
        let highScore = UserDefaults.standard.object(forKey: "highScore")
        
        if highScore == nil {
            highScoreLabel.text="0"
        }
        
        if let newScore = highScore as? Int{
            highScoreLabel.text=String(newScore)
        }
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameVC.countDown), userInfo: nil, repeats: true)
        
        
       
        
        
        //Starting and setting colors and text
        
        colourLabel.textColor = finalColor
        
        colourLabel.text = finalText
        
    }
    
    @IBAction func noButtonTap(_ sender: Any) {
        
        if (myColors[finalText]?.isEqual(finalColor))!{
            
            print("Rengler uygun gelir")
            
            score = 0
        }
        
        else {
            score+=1
        }
        
        scoreLabel.text = ("Score:  \(score)")
        
        finalColor=myColors[randomColor()]
        finalText=randomColor()
        
        colourLabel.textColor = finalColor
        
        colourLabel.text = finalText
    
    }
    
    
    @IBAction func yesButtonTap(_ sender: Any) {
        
        if (myColors[finalText]?.isEqual(finalColor))!{
            
            score+=1
            
        }
            
        else {
            score = 0
        }
        
        scoreLabel.text = ("Score:  \(score)")
        
        finalColor=myColors[randomColor()]
        finalText=randomColor()
        
        colourLabel.textColor = finalColor
        
        colourLabel.text = finalText
        
        }
    @objc func countDown(){
        
        counter-=1
        timerLabel.text=String("Timer: \(counter)")
        
        if score>Int(highScoreLabel.text!)!{
            
            UserDefaults.standard.set(score, forKey: "highScore")
            highScoreLabel.text = String(score)
            
            
            
        }
        
        
        if counter == 0 {
            
          
            timer.invalidate()
            
         
            
            let alert = UIAlertController(title: "Game Over", message: "Time is up!", preferredStyle: UIAlertController.Style.alert)
            
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
                score = 0
                self.scoreLabel.text = "Score: \(score)"
                counter = 60
                self.timerLabel.text = "Timer: \(counter)"
                
                self.colourLabel.text = "Game over!"
                
                self.colourLabel.isEnabled = false
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameVC.countDown), userInfo: nil, repeats: true)
                
                
            
            }
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                score = 0
                self.scoreLabel.text = "Score: \(score)"
                counter = 60
                self.timerLabel.text = "Timer: \(counter)"
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameVC.countDown), userInfo: nil, repeats: true)
                
              
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
        
        
    }

  
    
   
    


