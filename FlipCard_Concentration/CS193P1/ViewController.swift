//
//  ViewController.swift
//  CS193P1
//
//  Created by 張書涵 on 2017/11/19.
//  Copyright © 2017年 AliceChang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfParisOfCards: cardButtons.count/2)
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    var flipCount:Int = 0{
        didSet{
            flipCountLabel.text = "flip:\(flipCount)"
        }
    }
    
    
    @IBOutlet var cardButtons: [UIButton]!//用Array來表示不同的emoji
    
    @IBAction func touchCard(_ sender:UIButton){
        flipCount += 1
    if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updataViewFromModel()
        }else{
          print("choose other card")
        }
    }
    
    func updataViewFromModel(){
        for index in cardButtons.indices{//0..<cardButtons.count
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)//如果match就變透明,不match就橘色
            }
        }
    }
    
    var emoji = [Int:String]()
    
    var emojiChoices = ["♥️","👻","🎃","💡","🤡","❄️","🌈","🔥"]
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        
        return emoji[card.identifier] ?? "?"
        //回傳card.identifier不然就是問號符號,在emoji不夠時程式才不會crash
    }
    
}


