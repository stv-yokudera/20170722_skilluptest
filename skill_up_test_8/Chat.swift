//
//  Chat.swift
//  skill_up_test_8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import Foundation
import RealmSwift
import STV_Extensions

/// Realm Chatテーブルモデルクラス
final class Chat: Object {
    dynamic var chatId = 0
    
    dynamic var dateTime = Date()
    dynamic var message = ""
    
    override static func primaryKey() -> String? {
        return "chatId"
    }
}
