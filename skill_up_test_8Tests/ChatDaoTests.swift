//
//  ChatDaoTests.swift
//  skill_up_test_8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import XCTest
@testable import skill_up_test_8

final class ChatDaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        ChatDao.daoHelper.deleteAll()
    }
    
    override func tearDown() {
        ChatDao.daoHelper.deleteAll()
        super.tearDown()
    }
    
    /// 保存されているチャットを全件取得するテスト
    func testFindAllSortedDate() {
        
        // Setup
        setupChatsData()
        
        // Exercise
        let chats = ChatDao.findAllSortedDate()
        
        // Verify
        XCTAssertEqual(chats.count, 2)
        
        XCTAssertEqual(chats[0].chatId, 1)
        XCTAssertEqual(chats[0].dateTime.toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"), "2017/07/22 01:23:45")
        XCTAssertEqual(chats[0].message, "テストメッセージ")
        XCTAssertEqual(chats[1].chatId, 2)
        XCTAssertEqual(chats[1].dateTime.toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"), "2017/07/23 01:23:45")
        XCTAssertEqual(chats[1].message, "テストメッセージ2")
        
    }
    
    /// チャットを追加するテスト
    func testAdd() {
        
        // Setup
        let chat = Chat()
        chat.dateTime = "2017/07/22 01:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat.message = "テストメッセージ"
        
        // Exercise
        ChatDao.add(model: chat)
        
        // Verify
        let chats = ChatDao.findAllSortedDate()
        
        XCTAssertEqual(chats.count, 1)
        
        XCTAssertEqual(chats[0].chatId, 1)
        XCTAssertEqual(chats[0].dateTime.toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"), "2017/07/22 01:23:45")
        XCTAssertEqual(chats[0].message, "テストメッセージ")
    }
    
    // MARK: - private
    
    /// テストデータを追加する
    private func setupChatsData() {
        let chat1 = Chat()
        chat1.dateTime = "2017/07/22 01:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat1.message = "テストメッセージ"
        ChatDao.add(model: chat1)
        
        let chat2 = Chat()
        chat2.dateTime = "2017/07/23 01:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat2.message = "テストメッセージ2"
        ChatDao.add(model: chat2)
    }
}
