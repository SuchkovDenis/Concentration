//
//  Card.swift
//  Concentration
//
//  Created by Денис Сучков on 04.02.2021.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    static var idNumber = 0
    
    static func idGenerator() -> Int {
        idNumber += 1
        return idNumber
    }
    
    init() {
        self.id = Card.idGenerator()
    }
}
