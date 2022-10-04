//
//  GameView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import Foundation
import SwiftUI

struct GameView: View {
    
    @Binding var rootIsActive : Bool
    
    @ObservedObject var viewModel: GameViewModel

    @State var countDownTimer: Int = Const.secondsInRound
    @State var timerRunning: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            GameBackgroundView()
            VStack(spacing: 10) {
                HStack {
                    BackButton(tintColor: Assets.whiteColor.swiftUIColor) {
                        rootIsActive = false
                    }
                    Spacer()
                }
                CurrentPlayerView(player: viewModel.currentPlayer)
                Assets.GameScreen.gameCanvas.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        content(for: viewModel.state)
                            .padding(.horizontal, 30)
                    }
            }
            .padding(.horizontal, 30)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .onAppear {
            viewModel.finishGame = {
                rootIsActive = false
            }
        }
    }
    
    func content(for state: GameViewModel.GameState) -> AnyView {
        switch state {
        case .initial:
            return AnyView(StartGameView {
                viewModel.startNextRound()
            })
        case .question(let quiz):
            return AnyView(QuizView(
                quiz: quiz,
                correctAnswerAction: viewModel.correctAnswerSelected,
                wrongAnswerAction: viewModel.wrongAnswerSelected,
                timer: $countDownTimer
            )
                .onAppear {
                    countDownTimer = Const.secondsInRound
                    timerRunning = true
                }
                .onReceive(timer) { _ in
                    if countDownTimer > 0 && timerRunning {
                        countDownTimer -= 1
                    } else {
                        timerRunning = false
                        viewModel.wrongAnswerSelected()
                    }
                }
            )
        case .nextPlayer(let player):
            return AnyView(NextPlayerView(
                player: player,
                action: viewModel.startNextRound))
        case .wrongAnswer:
            return AnyView(FailView(action: viewModel.openPenaltyTask))
        case .penaltyTask(let penaltyTask):
            return AnyView(TaskView(penaltyTask: penaltyTask, action: viewModel.penaltyTaskDone))
        }
    }
        
    struct MemeView: View {
        
        let title: String
        let description: String
        let buttonTitle: String
        let buttonAction: () -> Void
        let withSticker: Bool
        
        let stickers: [String] = [
            Assets.Stickers.sticker1.name,
            Assets.Stickers.sticker2.name,
            Assets.Stickers.sticker3.name,
            Assets.Stickers.sticker4.name,
            Assets.Stickers.sticker5.name,
            Assets.Stickers.sticker6.name,
            Assets.Stickers.sticker7.name,
            Assets.Stickers.sticker8.name,
            Assets.Stickers.sticker9.name,
            Assets.Stickers.sticker10.name,
            Assets.Stickers.sticker11.name,
            Assets.Stickers.sticker12.name
        ]
        
        init(
            title: String,
            description: String,
            buttonTitle: String,
            buttonAction: @escaping () -> Void,
            withSticker: Bool = true
        ) {
            self.title = title
            self.description = description
            self.buttonTitle = buttonTitle
            self.buttonAction = buttonAction
            self.withSticker = withSticker
        }
        
        var body: some View {
            VStack(spacing: 40) {
                if withSticker {
                    Image(stickers.randomElement()!)
                }
                VStack(spacing: 10) {
                    Text(title)
                        .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                        .foregroundColor(Color.black)
                    Text((try? AttributedString(markdown: description)) ?? "")
                        .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 20))
                        .foregroundColor(Color.black)
                }
                Button {
                    buttonAction()
                } label: {
                    ButtonLabel(text: buttonTitle)
                }
            }
            .multilineTextAlignment(.center)
        }
    }
    
    struct StartGameView: View {
        
        let action: () -> Void
        
        var body: some View {
            MemeView(
                title: "Почнемо!",
                description: "Наберіть більше правильних відповідей чим ваш суперник",
                buttonTitle: "Старт",
                buttonAction: action)
        }
    }
    
    struct NextPlayerView: View {
        
        let player: Player
        let action: () -> Void
        
        var body: some View {
            MemeView(
                title: "Так тримати!",
                description: "Передай телефон наступному гравцеві\n **\(player.nickname)**",
                buttonTitle: "Старт",
                buttonAction: action
            )
        }
    }
    
    struct FailView: View {
        
        let action: () -> Void
        
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
        
        var body: some View {
            MemeView(
                title: titles.randomElement()!,
                description: descriptions.randomElement()!,
                buttonTitle: "Завдання",
                buttonAction: action
            )
        }
    }
    
    struct TaskView: View {
        
        let penaltyTask: Penalty
        let action: () -> Void
        
        var body: some View {
            MemeView(
                title: penaltyTask.text,
                description: "",
                buttonTitle: "Зарахувати",
                buttonAction: action,
                withSticker: false
            )
        }
    }
}

struct GameView_Previews: PreviewProvider {
    
    static let player = Player(nickname: "John", avatar: Assets.Avatars.avatarMale2.name)
    static let quiz = Question(text: "Як прозвали російського солдата , який став мемом? Ч...")
    static let viewModel = GameViewModel(players: [player]) {
        
    }
    static var previews: some View {
        GameView(rootIsActive: .constant(false), viewModel: viewModel)
            .previewInterfaceOrientation(.portrait)
        GameView(rootIsActive: .constant(false), viewModel: viewModel)
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
        GameView(rootIsActive: .constant(false),  viewModel: viewModel)
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
    }
}

// MARK: - CurrentPlayerView

extension GameView {
    
    struct CurrentPlayerView: View {
        
        let player: Player
        
        var body: some View {
            HStack {
                
                Image(player.avatar)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding(.horizontal, 17)
                    .padding(.vertical, 8)
                
                Text("**\(player.nickname)** твоя черга!")
                    .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 20))
                    .padding(.trailing, 17)
                    .foregroundColor(Color.black)
                
            }
            .background(Assets.whiteColor.swiftUIColor)
            .cornerRadius(17)
        }
    }
}

// MARK: - QuizView

extension GameView {
    
    struct QuizView: View {
        
        let quiz: Question
        
        let correctAnswerAction: () -> Void
        let wrongAnswerAction: () -> Void
        
        @Binding var timer: Int
        
        var body: some View {
            VStack (spacing: 40) {
                Text("\(timer)")
                    .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 44))
                    .foregroundColor(Assets.redColor.swiftUIColor)
                Text(quiz.text)
                    .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                    .foregroundColor(.black)
                VStack(spacing: 25) {
                    VStack(spacing: 10) {
                        Button(action: correctAnswerAction) {
                            ButtonLabel(text: "Зарахувати")
                        }
                        Button(action: wrongAnswerAction) {
                            ButtonLabel(
                                text: "Не знаю",
                                backgroundColor: Assets.redColor.swiftUIColor
                            )
                        }
                    }
                    Text("За неправильну відповідь ти отримуєш завдання яке треба виконати")
                        .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 13))
                        .foregroundColor(.black)
                }
            }
            .multilineTextAlignment(.center)
            .background(Assets.whiteColor.swiftUIColor)
        }
    }
}

// MARK: - -

extension GameView {
    
}

// MARK: - -

extension GameView {
    
}
