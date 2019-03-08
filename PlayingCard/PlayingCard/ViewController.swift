//
//  ViewController.swift
//  PlayingCard
//
//  Created by 張書涵 on 2019/3/6.
//  Copyright © 2019 張書涵. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left,.right]
            playingCardView.addGestureRecognizer(swipe)
            
            let pich = UIPinchGestureRecognizer(target: playingCardView, action: #selector(playingCardView.adjustFaceCardScale(byHandingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pich)
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default: break
        }
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card  = deck.draw() {
                print("\(card)")
            }
            
        }
        
        
    }


}

