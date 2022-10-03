//
//  GameViewModel.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import Foundation
import SwiftUI

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
    
    private var availableQuestions: [Question]
    private var availablePenalties: [Penalty]
    private var availableBlames: [Blame]
    
    @Published private(set) var state: GameState = .initial
    @Published private(set) var currentPlayer: Player
    
    var finishGame: (() -> Void)?
    
    init(
        players: [Player],
        finishGame:  (() -> Void)? = nil
    ) {
        
        self.finishGame = finishGame
        
        self.players = players
        self.platersIterator = players.makeIterator()
        
        questions = gameDataProvider.getQuestions()
        penalties = gameDataProvider.getPenalties()
        blames = gameDataProvider.getBlame()
        
        availableQuestions = questions
        availablePenalties = penalties
        availableBlames = blames
        
        self.currentPlayer = players.first!
        self.currentPlayer = self.getNextPlayer()
    }
    
    func startNextRound() {
        let question = getNextQuestion()
        state = .question(question)
    }
    
    func correctAnswerSelected() {
        
        if availableQuestions.isEmpty {
            finishGame?()
        } else {
            let player = getNextPlayer()
            currentPlayer = player
            state = .nextPlayer(player)
        }
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
        
        if availableQuestions.isEmpty {
            finishGame?()
        } else {
            let player = getNextPlayer()
            currentPlayer = player
            state = .nextPlayer(player)
        }
    }
    
    private func getNextPlayer() -> Player {
        if let player = platersIterator.next() {
            return player
        }
        
        platersIterator = players.makeIterator()
        return getNextPlayer()
    }
    
    private func getNextQuestion() -> Question {
        
        let idx = Int((0..<availableQuestions.count).randomElement()!)
        let penaltyTask = availableQuestions[idx]
        availableQuestions.remove(at: idx)
        return penaltyTask
    }
    
    private func getNextPenaltyTask() -> Penalty {
        if availablePenalties.isEmpty {
            availablePenalties = penalties
        }
        let idx = Int((0..<availablePenalties.count).randomElement()!)
        let penaltyTask = availablePenalties[idx]
        availablePenalties.remove(at: idx)
        return penaltyTask
    }
    
    private func getNextBlame() -> Blame {
        if availableBlames.isEmpty {
            availableBlames = blames
        }
        let idx = Int((0..<availableBlames.count).randomElement()!)
        let penaltyTask = availableBlames[idx]
        availableBlames.remove(at: idx)
        return penaltyTask
    }
}
