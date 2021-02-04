//
//  ViewController.swift
//  Concentration
//
//  Created by Денис Сучков on 03.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var touchLable: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1;
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }

    var emojiCollection = ["🐻", "🐰", "🦊", "🐸", "🐵", "🦋", "🦢", "🐳"]
    var emojiDictionary = [Int:String]()
    
    lazy var game = ConcentrationGame(numberOfPairCards: (buttonCollection.count + 1) / 2)
    
    var touches = 0 {
        didSet {
            touchLable.text = "Touches: \(touches)"
        }
    }

    func emodjiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.id] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.id] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.id] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emodjiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
            }
        }
    }
}

