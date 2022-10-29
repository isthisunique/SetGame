import UIKit

class ViewController: UIViewController {

    let game = SetGame()
    
    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func selectCard(_ sender: UIButton) {
        if let index = cardButtons.firstIndex(of: sender) {
            game.selectCard(card: game.visibleCards[index])
            updateViewFromModel()
        }
    }

    func updateViewFromModel() {
        for cardButton in cardButtons {
            cardButton.alpha = 0
            cardButton.backgroundColor = UIColor.white
            cardButton.layer.borderWidth = 0
        }

        for cardIndex in game.visibleCards.indices {
            cardButtons[cardIndex].configurationUpdateHandler = { button in
                button.configuration?.attributedTitle = self.getStringForCard(card: self.game.visibleCards[cardIndex])
            }
            cardButtons[cardIndex].alpha = 1

            if game.cardIsSelected(card: game.visibleCards[cardIndex]) {
                cardButtons[cardIndex].layer.borderWidth = 3.0
            }

            if game.cardIsMatched(card: game.visibleCards[cardIndex]) {
                cardButtons[cardIndex].backgroundColor = UIColor.green.withAlphaComponent(0.25)
            }
        }
    }

    func getStringForCard(card: Card) -> AttributedString {
        return AttributedString(String(card))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }
}
