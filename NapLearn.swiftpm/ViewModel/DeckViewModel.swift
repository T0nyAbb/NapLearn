import SwiftUI

final class DeckViewModel: ObservableObject {
    private var deck: Deck? = nil
    
    var deckState: DeckState = .loading
    
    
    enum DeckState {
        case loading, playing, submitting, finished
    }
    
    @Published var cards = [Monument]()
    @Published var answers = [String]()
    @Published var flipped = false
    @Published var rotation: CGFloat = 0
    @Published var passing: Bool = false
    @Published var failing: Bool = false
    
    var stats = [DeckStatistic]()
    
    var topCard: Monument {
        cards.isEmpty ? Constants.monuments.first! : cards[cards.count-1]
    }
    
    func setupDeck(_ deck: Deck) {
        self.deckState = .loading
        self.deck = deck
        
        var delay = 0.0
        for card in deck.monuments.shuffled() {
            LiyAnimation(.spring, duration: Constants.setupDuration) {
                self.cards.append(card)
            }.playAfter(duration: delay)
            delay += 0.2
        }
        
        LiyAnimation(duration: Constants.setupDuration) {
            self.setupAnswers()
            self.deckState = .playing
        }.playAfter(duration: delay)
    }
    
    func setupAnswers() {
        self.answers = []
        var newAnswers = topCard.answers
        newAnswers.append(topCard.name)
        
        for answer in newAnswers.shuffled() {
            self.answers.append(answer)
        }
    }
    
    func nextCard() {
        LiyAnimation(duration: Constants.nextCardAnimationLength) {
            self.deckState = .playing
            self.cards.remove(at: self.cards.count-1)
            self.flipped = false
            self.rotation = 0.0
            self.setupAnswers()
            self.checkForEndGame()
        }.playAfter(duration: Constants.nextCardAnimationLength)
        
        self.setupAnswers()
    }

    func submitAnswer(_ monumentName: String) {
        deckState = .submitting
        
        let answerWasCorrect = monumentName == topCard.name
        let statistics = DeckStatistic(monument: topCard, wasCorrect: answerWasCorrect)
        stats.append(statistics)
        
        flip()
        flash(passing: answerWasCorrect)
        nextCard()
    }   
    
    func flip() {
        let secondTurn = LiyAnimation(.spring, duration: Constants.halfFlipAnimationLength, next: nil) {
            self.rotation += 90
        }
        
        let flipViews = LiyAnimation(.spring, duration: 0.01, next: secondTurn) {
            self.flipped.toggle()
        }
        
        let firstTurn = LiyAnimation(.spring, duration: Constants.halfFlipAnimationLength, next: flipViews) {
            self.rotation += 90
        }
        
        firstTurn.play()
    }
    
    func flash(passing: Bool) {
        let flashOff = LiyAnimation(duration: Constants.flashAnimationLength, delay: Constants.flashAnimationLength) {
            if passing {
                self.passing = false
            } else {
                self.failing = false
            }
        }
        
        let flashOn = LiyAnimation(duration: Constants.flashAnimationLength, next: flashOff, delay: Constants.flashAnimationLength) {
            if passing {
                self.passing = true
            } else {
                self.failing = true
            }
        }
        
        flashOn.play()
    }
    
    func checkForEndGame() {
        if cards.isEmpty {
            deckState = .finished
        }
    }
}
