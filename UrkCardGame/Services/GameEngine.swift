//
//  GameEngine.swift
//  UrkCardGame
//
//  Created by Ivan on 15/10/2022.
//

import Foundation

protocol GameEngine: ObservableObject {
    associatedtype State
    
    var players: [Player] { get }
    var currentPlayer: Player? { get }
    var state: State { get }
    
    func start()
    func restart()
    
    func addPlayer(_ player: Player)
    func removePlayer(_ player: Player)
}

class CardGameEngine: GameEngine {
    
    typealias AnswerHandler = (Bool) -> Void
    typealias ActionHandler = () -> Void
    
    enum State {
        case initial
        case question(Question, AnswerHandler)
        case nextPlayer(Player, ActionHandler)
        case blame(Blame, ActionHandler)
        case penaltyTask(Penalty, ActionHandler)
        case end
    }
    
    let gameDataProvider: GameDataProviderProtocol
    
    @Published private(set) var players: [Player] = []
    @Published private(set) var currentPlayer: Player? = nil
    @Published private(set) var state: State = .initial
    
    private let questions: [Question]
    private let penalties: [Penalty]
    private let blames: [Blame]
    
    private var playersIterator: Iterator<[Player]>? = nil
    private var questionsIterator: Iterator<[Question]>? = nil
    private var penaltiesIterator: Iterator<[Penalty]>? = nil
    private var blamesIterator: Iterator<[Blame]>? = nil
    
    init(
        gameDataProvider: GameDataProviderProtocol
    ) {
        self.gameDataProvider = gameDataProvider
        
        questions = gameDataProvider.getQuestions()
        penalties = gameDataProvider.getPenalties()
        blames = gameDataProvider.getBlame()
    }
    
    var canStart: Bool {
        players.count > 1
    }
    
    func addPlayer(_ player: Player) {
        players.append(player)
    }
    
    func removePlayer(_ player: Player) {
        players.removeAll { p in
            p.id == player.id
        }
    }
    
    func restart() {
        playersIterator = .init(elements: players, repeating: true)
        questionsIterator = .init(elements: questions, shuffle: true)
        penaltiesIterator = .init(elements: penalties, repeating: true, shuffle: true)
        blamesIterator = .init(elements: blames, repeating: true, shuffle: true)
        
        currentPlayer = nil
        state = .initial
    }
    
    func start() {
        guard canStart else {
            end()
            return
        }
        
        if let player = playersIterator?.next() {
            currentPlayer = player
            nextQuestion()
        }
    }
    
    private func nextQuestion() {
        guard let question = questionsIterator?.next() else {
            end()
            return
        }
        
        state = .question(question, { [weak self] result in
            if result {
                self?.correctAnswer()
            } else {
                self?.wrongAnswer()
            }
        })
    }
    
    private func correctAnswer() {
        guard
            questionsIterator?.hasNext() ?? false,
            let player = playersIterator?.next()
        else {
            end()
            return
        }
        
        currentPlayer = player
        state = .nextPlayer(player) { [weak self] in self?.nextQuestion() }
    }
    
    private func wrongAnswer() {
        guard let blame = blamesIterator?.next() else {
            end()
            return
        }
        state = .blame(blame) { [weak self] in self?.openPenalty() }
    }
    
    private func openPenalty() {
        guard let penalty = penaltiesIterator?.next() else {
            end()
            return
        }
        state = .penaltyTask(penalty) { [weak self] in self?.correctAnswer() }
    }
    
    private func end() {
        currentPlayer = nil
        state = .end
    }
}

extension CardGameEngine {
    
    static let stub: CardGameEngine = {
        let dataProvider = GameDataProvider()
        let gameEngine = CardGameEngine(gameDataProvider: dataProvider)
        gameEngine.players = Player.defaultPlayers
        return gameEngine
    }()
}
