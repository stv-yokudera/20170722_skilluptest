//
//  ChatTableViewProvider.swift
//  skill_up_test_8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import UIKit
import STV_Extensions

final class ChatTableViewProvider: NSObject {
    
    fileprivate var chats = [Chat]()
    
    func set(chats: [Chat]) {
        self.chats = chats
    }
//    
//    /// 日付ごとにグルーピングする
//    ///
//    /// - Parameter chats: DBから取得したChatのはいれつ
//    /// - Returns:
//    func dateCheck(with chats: [Chat]) -> [[String:String]] {
//        
//        var chatDictionary = [String:String]()
//        var chatDics = [[String:String]]()
//        
//        chats.forEach {
//            let date = $0.dateTime.toStr(dateFormat: "yyyy-MM-dd")
//            let time = $0.dateTime.toStr(dateFormat: "hh:mm")
//            chatDictionary["date"] = date
//            chatDictionary["time"] = time
//            chatDictionary["message"] = $0.message
//            
//            chatDics.append(chatDictionary)
//        }
//        
//        chatDics.map {
//            $0.sorted(by: $0.$)
//        }
//    }
}

extension ChatTableViewProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell().reuseIdentifier!, for: indexPath) as! ChatTableViewCell
        cell.textView.text = chats[indexPath.row].message
        cell.timeLabel.text = chats[indexPath.row].dateTime.toStr(dateFormat: "hh:mm")
        return cell
    }
}
