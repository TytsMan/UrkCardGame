//
//  Player.swift
//  UrkCardGame
//
//  Created by Ivan on 03/10/2022.
//

import Foundation

struct Player: Identifiable {
    
    var id: UUID
    let nickname: String
    let avatar: String
    var points: Int = 0
    
    init(
        id: UUID = UUID(),
        nickname: String,
        avatar: String,
        points: Int = 0
    ) {
        self.id = id
        self.nickname = nickname
        self.avatar = avatar
        self.points = points
    }
}

extension Player {
    static let definedAvatars: [String] = [
        Assets.Avatars.avatarMale1.name,
        Assets.Avatars.avatarFemale1.name,
        Assets.Avatars.avatarFemale2.name,
        Assets.Avatars.avatarMale2.name,
        Assets.Avatars.avatarMale3.name,
        Assets.Avatars.avatarMale4.name
    ]
}

extension Player {
    static let defaultPlayers = [
        Player(nickname: "Назар", avatar: definedAvatars[0]),
        Player(nickname: "Марійка", avatar: definedAvatars[1])
    ]
}
