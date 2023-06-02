//
//  Card.swift
//  CardWorkout
//
//  Created by Bruno Albino on 01/06/23.
//

import UIKit

let cardSigns: [String] = ["C", "D", "H", "S"]
let cardPowers: [String] = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

struct Card {
    static let allCards: [UIImage] = {
        var cards: [UIImage] = []
        
        for cardPower in cardPowers {
            for cardSign in cardSigns {
                let image = UIImage(named: "\(cardPower)\(cardSign)")!
                cards.append(image)
            }
        }
        
        return cards
    }()
}
