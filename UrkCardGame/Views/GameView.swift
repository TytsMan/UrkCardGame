//
//  GameView.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import Foundation
import SwiftUI

struct GameView: View {
     
    @EnvironmentObject private var gameEngine: CardGameEngine
    
    @Binding var rootIsActive : Bool
    
    @State private var pushRateView = false
    @State private var pushStickerStoreView = false
    @State private var countDownTimer: Int = Const.secondsInRound
    @State private var timerRunning: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var roundCounter = 0
    
    var body: some View {
        ZStack {
            GameBackgroundView()
            VStack(spacing: 10) {
                HStack {
                    BackButton(tintColor: Assets.Colors.secondaryColor.swiftUIColor) {
                        rootIsActive = false
                    }
                    Spacer()
                }
                if let currentPlayer = gameEngine.currentPlayer {
                    CurrentPlayerView(player: currentPlayer)
                }
                Assets.GameScreen.gameCanvas.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        content(for: gameEngine.state)
                            .padding(.horizontal, 30)
                    }
            }
            .padding(.horizontal, 30)
            
            NavigationLink(
                destination: RateView(),
                isActive: self.$pushRateView) {
                    EmptyView()
                }.hidden()
            
            NavigationLink(
                destination:  StickerPackStoreView(),
                isActive: self.$pushStickerStoreView) {
                    EmptyView()
                }.hidden()
        }
        .ignoresSafeArea()
        //        .onAppear {
        //            viewModel.finishGame = {
        //                rootIsActive = false
        //            }
        //            viewModel.openStickerStore = {
        //                pushStickerStoreView = true
        //            }
        //        }
        .hiddenNavigationBarStyle()
        .hiddenStatusBarStyle()
    }
    
    func content(for state: CardGameEngine.State) -> AnyView {
        switch state {
        case .initial:
            return AnyView(StartGameView(action: gameEngine.start))
        case let .question(question, hander):
            return AnyView(QuizView(
                quiz: question,
                handler: hander,
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
                        hander(false)
                    }
                }
            )
        case let .nextPlayer(player, handler):
            return AnyView(NextPlayerView(
                player: player,
                action: handler))
        case let .blame(blame, handler):
            return AnyView(FailView(blame: blame, action: handler))
        case let .penaltyTask(penalty, handler):
            return AnyView(TaskView(penaltyTask: penalty, action: handler))
        case .end:
            DispatchQueue.main.async {
                rootIsActive = false
            }
            return AnyView(EmptyView())
        }
    }
    
    struct MemeView: View {
        
        let title: String
        let description: String
        let buttonTitle: String
        let buttonAction: () -> Void
        let sticker: String?
        
        init(
            title: String,
            description: String,
            buttonTitle: String,
            buttonAction: @escaping () -> Void,
            sticker: String? = nil
        ) {
            self.title = title
            self.description = description
            self.buttonTitle = buttonTitle
            self.buttonAction = buttonAction
            self.sticker = sticker
        }
        
        var body: some View {
            VStack(spacing: 40) {
                if let sticker = sticker {
                    Image(sticker)
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
        let sticker = Assets.Stickers.sticker1.name
        
        var body: some View {
            MemeView(
                title: "Почнемо!",
                description: "Наберіть більше правильних відповідей чим ваш суперник",
                buttonTitle: "Старт",
                buttonAction: action,
                sticker: sticker
            )
        }
    }
    
    struct NextPlayerView: View {
        
        let player: Player
        let action: () -> Void
        
        let stickers: [String] = [
            Assets.Stickers.sticker2.name,
            Assets.Stickers.sticker3.name,
            Assets.Stickers.sticker4.name
        ]
        
        var body: some View {
            MemeView(
                title: "Так тримати!",
                description: "Передай телефон наступному гравцеві\n **\(player.nickname)**",
                buttonTitle: "Старт",
                buttonAction: action,
                sticker: stickers.randomElement()!
            )
        }
    }
    
    struct FailView: View {
        
        let blame: Blame
        let action: () -> Void
        
        let stickers: [String] = [
            Assets.Stickers.sticker5.name,
            Assets.Stickers.sticker6.name,
            Assets.Stickers.sticker7.name,
            Assets.Stickers.sticker8.name,
            Assets.Stickers.sticker9.name,
            Assets.Stickers.sticker10.name,
            Assets.Stickers.sticker11.name,
            Assets.Stickers.sticker12.name
        ]
        
        var body: some View {
            MemeView(
                title: blame.title,
                description: blame.text,
                buttonTitle: "Завдання",
                buttonAction: action,
                sticker: stickers.randomElement()!
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
                buttonAction: action
            )
        }
    }
}

struct GameView_Previews: PreviewProvider {
    
//    static let player = Player(nickname: "John", avatar: Assets.Avatars.avatarMale2.name)
//    static let quiz = Question(text: "Як прозвали російського солдата , який став мемом? Ч...")
//    static let viewModel = GameViewModel(players: [player]) {
//
//    }
    static var previews: some View {
        GameView(rootIsActive: .constant(false))
            .previewInterfaceOrientation(.portrait)
            .environmentObject(CardGameEngine.stub)
        GameView(rootIsActive: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
            .environmentObject(CardGameEngine.stub)
        GameView(rootIsActive: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .environmentObject(CardGameEngine.stub)
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
            .background(Assets.Colors.secondaryColor.swiftUIColor)
            .cornerRadius(17)
        }
    }
}

// MARK: - QuizView

extension GameView {
    
    struct QuizView: View {
        
        let quiz: Question
        let handler: CardGameEngine.AnswerHandler
        
        @Binding var timer: Int
        
        var body: some View {
            VStack (spacing: 40) {
                Text("\(timer)")
                    .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 44))
                    .foregroundColor(Assets.Colors.negativeColor.swiftUIColor)
                Text(quiz.text)
                    .font(FontFamily.SFCompactRounded.semibold.swiftUIFont(size: 26))
                    .foregroundColor(.black)
                VStack(spacing: 25) {
                    VStack(spacing: 10) {
                        Button {
                            handler(true)
                        } label: {
                            ButtonLabel(text: "Зарахувати")
                        }
                        Button {
                            handler(false)
                        } label: {
                            ButtonLabel(
                                text: "Не знаю",
                                backgroundColor: Assets.Colors.negativeColor.swiftUIColor
                            )
                        }
                    }
                    Text("За неправильну відповідь ти отримуєш завдання яке треба виконати")
                        .font(FontFamily.SFCompactRounded.medium.swiftUIFont(size: 13))
                        .foregroundColor(.black)
                }
            }
            .multilineTextAlignment(.center)
            .background(Assets.Colors.secondaryColor.swiftUIColor)
        }
    }
}

// MARK: - -

extension GameView {
    
}

// MARK: - -

extension GameView {
    
}
