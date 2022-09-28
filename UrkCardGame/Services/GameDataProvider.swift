//
//  GameDataProvider.swift
//  UrkCardGame
//
//  Created by Ivan on 28/09/2022.
//

import Foundation

protocol GameDataProviderProtocol {
    
    func getQuestions() -> [Question]
    func getPenalties() -> [Penalty]
    func getBlame() -> [Blame]
    
}

class GameDataProvider: GameDataProviderProtocol {
    
    func getQuestions() -> [Question] {
//        let filename = "/Resources/Questions.txt"
        let filename = "Questions"
        let strings = readFile(withName: filename)
        let questions = strings.map(Question.init)
        return questions
    }
    
    func getPenalties() -> [Penalty] {
//        let filename = "/Resources/Penalties.txt"
        let filename = "Penalties"
        let strings = readFile(withName: filename)
        let penalties = strings.map(Penalty.init)
        return penalties
    }
    
    func getBlame() -> [Blame] {
        
        let titles: [String] = [
            "А ти точно не сэпар?",
            "Навіть Арестович в шоці",
            "Знущаєшся?",
            "Тобі не соромно?",
            "Знову невдало!",
            "Сідай Два!",
            "Тримайся!"
        ]
        
        let descriptions: [String] = [
            "Виконай завдання щоб довести протилежне 🇺🇦",
            "Виконай завдання зараз, а не через “2-3 недели”😂",
            "Мені соромно за тебе, ану бігом виконувати завдання",
            "Виконуй завдання скоріш!",
            "Так виглядає полуниця? Виконуй завдання бігом!",
            "Це нікуди не годиться, ану бігом завдання виконувать",
            "Невдачі роблять тебе сильніше, а поки виконуй завдання"
        ]
        
        var result = Array<Blame>()
        result.reserveCapacity(max(titles.count, descriptions.count))
        
        for (title, text) in zip(titles, descriptions) {
            result.append(Blame(title: title, text: text))
        }

        return result
    }
    
    private func readFile(withName filename: String) -> [String] {
        var result: [String] = []
        
        do {
            let path = Bundle.main.path(forResource: "\(filename)", ofType: "txt") // file path for file "data.txt"
            let contents = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
//            let contents = try String(contentsOfFile: filename)
            let lines = contents.split(separator:"\n")
            result = lines.map(String.init)
        } catch {
            print(error.localizedDescription)
        }
        return result
    }
    
}
