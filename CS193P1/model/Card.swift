//
//  Card.swift
//  CS193P1
//
//  Created by 張書涵 on 2017/12/19.
//  Copyright © 2017年 AliceChang. All rights reserved.
//
import Foundation

struct Card {
    
    // Type Property and Method, 'var instance = Card()' not have those
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
