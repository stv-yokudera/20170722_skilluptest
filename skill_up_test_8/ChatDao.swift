//
//  ChatDao.swift
//  skill_up_test_8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import Foundation
import RealmSwift

final class ChatDao {
    
    static let daoHelper = RealmDaoHelper<Chat>()
    
    // MARK: - find
    
    /// 古い順で、全件取得する
    static func findAllSortedDate() -> [Chat] {
        let objects =  daoHelper.findAll().sorted(byKeyPath: "dateTime", ascending: true)
        return objects.map { Chat(value: $0) }
    }
    
    // MARK: - add
    
    /// レコードを追加する
    static func add(model: Chat) {
        
        let newObject = Chat()
        
        if let newId = daoHelper.newId() {
            newObject.chatId = newId
        }
        newObject.dateTime = model.dateTime
        newObject.message = model.message
        
        daoHelper.add(d: newObject)
    }
}
