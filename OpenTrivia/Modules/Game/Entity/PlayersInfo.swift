//
//  PlayersInfo.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation
import RealmSwift

class PlayersInfo: Entity {
    typealias RealmEntityType = PlayersInfoRealm

    var id: Int64 = 0
    var playerOneName: String = ""
    var playerOneScore: Int = 0
    var playerTwoName: String = ""
    var playerTwoScore: Int = 0
    var playerTurn: Int = 1
    var date: Date = Date()
    
    public init(entity: RealmEntityType) {
        self.id = entity.id
        self.playerOneName = entity.playerOneName
        self.playerOneScore = entity.playerOneScore
        self.playerTwoName = entity.playerTwoName
        self.playerTwoScore = entity.playerTwoScore
        self.date = entity.date
    }
    
    var realmObject: PlayersInfoRealm {
        return PlayersInfoRealm(entity: self)
    }
}

class PlayersInfoRealm: Object, RealmEntity {
    typealias EntityType = PlayersInfo
    
    @objc dynamic var id: Int64 = 0
    @objc dynamic var playerOneName: String = ""
    @objc dynamic var playerOneScore: Int = 0
    @objc dynamic var playerTwoName: String = ""
    @objc dynamic var playerTwoScore: Int = 0
    @objc dynamic var date: Date = Date()

    convenience required init(entity: EntityType) {
        self.init()
        self.id = entity.id
        self.playerOneName = entity.playerOneName
        self.playerOneScore = entity.playerOneScore
        self.playerTwoName = entity.playerTwoName
        self.playerTwoScore = entity.playerTwoScore
        self.date = entity.date
    }
    
    var entityObject: PlayersInfo {
        return PlayersInfo(entity: self)
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
