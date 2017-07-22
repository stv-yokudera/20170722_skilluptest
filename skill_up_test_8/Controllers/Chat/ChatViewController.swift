//
//  ChatViewController.swift
//  skill_up_test_8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import UIKit

final class ChatViewController: UIViewController {
    
    // MARK: - properties
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    fileprivate var dataSource = ChatTableViewProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    deinit {
        self.removeNotificationsObserver()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if textView.isFirstResponder {
            textView.resignFirstResponder()
        }
    }
    
    // MARK: - keyboard
    func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo!
        let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let myBoundSize: CGSize = UIScreen.main.bounds.size
        let txtLimit = textView.frame.origin.y + textView.frame.height + 8.0
        let kbdLimit = myBoundSize.height - keyboardRect.size.height
        //スクロールビューの移動距離設定
        if txtLimit >= kbdLimit {
            textView.contentOffset.y = txtLimit - kbdLimit
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        textView.contentOffset.y = 0
    }
}

private extension ChatViewController {
    
    /// 初期処理
    func setup() {
        let chats = ChatDao.findAllSortedDate()
        dataSource.set(chats: chats)
        tableView.dataSource = dataSource
        tableView.reloadData()
        
        textView.delegate = self
        
        // register Notification
        addNotificationObserver(name: .UIKeyboardWillShow, selector: .keyboardWillShow)
        addNotificationObserver(name: .UIKeyboardWillHide, selector: .keyboardWillHide)
    }
    
    // MARK: - action
    @IBAction func didTapSend(_ sender: Any) {
    }
}

extension ChatViewController: UITextViewDelegate {
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView.isFirstResponder {
            textView.resignFirstResponder()
        }
        return true
    }
}

private extension Selector {
    static let keyboardWillShow = #selector(ChatViewController.keyboardWillShow(notification:))
    static let keyboardWillHide = #selector(ChatViewController.keyboardWillHide(notification:))
}
