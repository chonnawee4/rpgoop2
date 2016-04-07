//
//  Game.swift
//  rpgoop2
//
//  Created by Chonnawee on 4/7/2559 BE.
//  Copyright © 2559 Chonnawee. All rights reserved.
//

import Foundation

class Game {
    
    private var _gameState: Int = 1
    
    var gameState:Int {
        get {
            return _gameState
        }
    }
    
    init(gameState: Int) {
        self._gameState = gameState
    }
}
