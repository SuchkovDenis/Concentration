//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Денис Сучков on 04.02.2021.
//

import Foundation

class ConcentrationGame {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].id == cards[index].id {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairCards: Int) {
        for _ in 1...numberOfPairCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
