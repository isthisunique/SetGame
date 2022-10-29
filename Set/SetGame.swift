import Foundation

typealias Card = Int

class SetGame {
    private(set) var cardDeck: [Card]
    private(set) var visibleCards = [Card]()
    private(set) var selectedCards = [Card]()
    private(set) var matchedCards = [Card]()

    init() {
        cardDeck = [1,2,3]
        visibleCards = Array(cardDeck[0..<2])
        cardDeck = Array(cardDeck.dropFirst(2))
    }
    
    func cardIsSelected(card: Card) -> Bool {
        return selectedCards.contains(where: {$0 == card})
    }

    func cardIsMatched(card: Card) -> Bool {
        return matchedCards.contains(where: {$0 == card})
    }

    func selectCard(card: Card) {
        if selectedCards.count == 1 {
            if cardIsMatched(card: selectedCards[0]) {
                for selectedCard in selectedCards {
                    visibleCards.removeAll(where: {$0 == selectedCard})
                }
            }

            selectedCards = []
        }

        if cardIsSelected(card: card) {
            selectedCards = []
        } else {
            selectedCards.append(card)
        }

        if selectedCards.count == 1 {
            matchedCards.append(contentsOf: selectedCards)
        }
    }
}
