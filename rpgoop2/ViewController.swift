//
//  ViewController.swift
//  rpgoop2
//
//  Created by Chonnawee on 4/7/2559 BE.
//  Copyright © 2559 Chonnawee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player1Img: UIImageView!
    
    @IBOutlet weak var player2Img: UIImageView!
    
    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var player1HpLbl: UILabel!
    
    @IBOutlet weak var player2HpLbl: UILabel!
    
    @IBOutlet weak var attack1Btn: UIButton!

    @IBOutlet weak var attack2Btn: UIButton!
    
    var gameState: Game!
    var player1: Character!
    var player2: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterSelectState()
    }
    
    func characterSelectState() {
        gameState = Game(gameState: 1)
        printLbl.text = "Character Select"
        
        player1 = Character(name: "Orcccc", hp: 100, attackPwr: 20)
        player2 = Character(name: "Knightt", hp: 100, attackPwr: 20)
        
        player1HpLbl.text = "\(player1.hp) HP"
        player2HpLbl.text = "\(player2.hp) HP"
        
        attack1Btn.hidden = true
        attack2Btn.hidden = true
        
        player1Img.hidden = false
        player2Img.hidden = false
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(battleState), userInfo: nil, repeats: false)
    }
    
    func battleState() {
        gameState = Game(gameState: 2)
        printLbl.text = "Battle Start"
        
        changeAttackButtonState()
    }
    
    func changeAttackButtonState() {
        attack1Btn.hidden = !attack1Btn.hidden
        attack2Btn.hidden = !attack2Btn.hidden
    }

    @IBAction func attack1Tapped(sender: AnyObject) {
        player2.attempAttack(player1.attackPwr)
        printLbl.text = "\(player1.name) attacked \(player2.name) for \(player1.attackPwr)"
        player2HpLbl.text = "\(player2.hp) HP"
        changeAttackButtonState()
        
        if (player2.isAlive) {
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(changeAttackButtonState), userInfo: nil, repeats: false)
        } else {
            player2Img.hidden = true
            printLbl.text = "Restart Game"
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(characterSelectState), userInfo: nil, repeats: false)
        }
    }

    @IBAction func attack2Tapped(sender: AnyObject) {
        player1.attempAttack(player2.attackPwr)
        printLbl.text = "\(player2.name) attacked \(player1.name) for \(player2.attackPwr)"
        player1HpLbl.text = "\(player1.hp) HP"
        changeAttackButtonState()
        
        if (player1.isAlive) {
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(changeAttackButtonState), userInfo: nil, repeats: false)
        } else {
            player1Img.hidden = true
            printLbl.text = "Restart Game"
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(characterSelectState), userInfo: nil, repeats: false)
        }
    }
}

