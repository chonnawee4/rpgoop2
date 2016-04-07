//
//  Character.swift
//  rpgoop2
//
//  Created by Chonnawee on 4/7/2559 BE.
//  Copyright © 2559 Chonnawee. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _name: String = "Untitle"
    private var _attackPwr: Int = 20
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var isAlive: Bool {
        if hp > 0 {
            return true
        } else {
            return false
        }
    }
    
    init(name: String, hp: Int, attackPwr: Int) {
        self._name = name
        self._hp = hp
        self._attackPwr = attackPwr
    }
    
    func attempAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
    
        return true
    }
}
