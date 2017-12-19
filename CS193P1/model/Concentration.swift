//
//  Concentration.swift
//  CS193P1
//
//  Created by 張書涵 on 2017/12/19.
//  Copyright © 2017年 AliceChang. All rights reserved.
//

import Foundation
class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard:Int?
    
    func chooseCard(at index:Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index{
           //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no card or 2 face up
                for flipdownIndex in cards.indices{
                    cards[flipdownIndex].isFaceUp = false
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }

        }
    }
    
    init(numberOfParisOfCards:Int) {
        for _ in 1...numberOfParisOfCards{
            let card = Card()
            cards += [card,card]
        }//TODO:Shufle the card
        
    }
}
