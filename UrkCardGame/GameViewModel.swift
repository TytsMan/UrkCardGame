//
//  GameViewModel.swift
//  UrkCardGame
//
//  Created by Ivan on 28/09/2022.
//

import Foundation

class GameViewModel: ObservableObject {
    
    enum GameState {
        case initial
        case question(Question)
        case nextPlayer(Player)
        case wrongAnswer(Blame)
        case penaltyTask(Penalty)
    }
    
    let gameDataProvider: GameDataProviderProtocol = GameDataProvider()
    
    private let players: [Player]
    private var platersIterator: IndexingIterator<[Player]>
    
    private let questions: [Question]
    private let penalties: [Penalty]
    private let blames: [Blame]
    
    @Published private(set) var state: GameState = .initial
    @Published private(set) var currentPlayer: Player
    
    init(
        players: [Player]
    ) {
        self.players = players
        self.platersIterator = players.makeIterator()
        self.currentPlayer = players.first!
        
        questions = gameDataProvider.getQuestions()
        penalties = gameDataProvider.getPenalties()
        blames = gameDataProvider.getBlame()
    }
    
    func startNextRound() {
        let question = getNextQuestion()
        state = .question(question)
    }
    
    func correctAnswerSelected() {
        let player = getNextPlayer()
        currentPlayer = player
        state = .nextPlayer(player)
    }
    
    func wrongAnswerSelected() {
        let blame = getNextBlame()
        state = .wrongAnswer(blame)
    }
    
    func openPenaltyTask() {
        let penaltyTask = getNextPenaltyTask()
        state = .penaltyTask(penaltyTask)
    }
    
    func penaltyTaskDone() {
        let question = getNextQuestion()
        state = .question(question)
    }
    
    private func getNextQuestion() -> Question {
        return questions.randomElement()!
    }
    
    private func getNextPlayer() -> Player {
        if let player = platersIterator.next() {
            return player
        }
        
        platersIterator = players.makeIterator()
        return getNextPlayer()
    }
    
    private func getNextPenaltyTask() -> Penalty {
        return penalties.randomElement()!
    }
    
    private func getNextBlame() -> Blame {
        return blames.randomElement()!
    }
    
}
