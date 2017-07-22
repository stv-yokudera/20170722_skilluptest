//
//  ChatTests.swift
//  skill_up_test_8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import XCTest
@testable import skill_up_test_8

class ChatTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /// PrimaryKeyが正しいかテスト
    func testPrimaryKey() {
        // Verify
        XCTAssertEqual(Chat.primaryKey(), "chatId")
    }
}
