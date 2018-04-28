//
//  ViewController.swift
//  LINESample
//
//  Created by TakaoAtsushi on 2018/04/28.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var chatTableView: UITableView!
    
    var bottomView: ChatRoomInputView! //画面下部に表示するテキストフィールドと送信ボタン
    
    var chats: [Chat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.dataSource = self
        chatTableView.delegate = self
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpUI()

    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        return bottomView //通常はテキストフィールドのプロパティに設定しますが、画面を表示している間は常に表示したいため、ViewControllerのプロパティに設定します
    }
    
    
    func setUpUI() {
        self.view.backgroundColor = UIColor(red: 113/255, green: 148/255, blue: 194/255, alpha: 1.0)
        chatTableView.backgroundColor = UIColor(red: 113/255, green: 148/255, blue: 194/255, alpha: 1.0)
        
        chatTableView.separatorColor = UIColor.clear
        chatTableView.estimatedRowHeight = 10000
        chatTableView.rowHeight = UITableViewAutomaticDimension
        chatTableView.allowsSelection = false
        chatTableView.keyboardDismissMode = .interactive
        
        chatTableView.register(UINib(nibName: "YourChatTableViewCell", bundle: nil), forCellReuseIdentifier: "YourChatCell")
        chatTableView.register(UINib(nibName: "MyChatTableViewCell", bundle: nil), forCellReuseIdentifier: "MyChatCell")
        
        self.bottomView = ChatRoomInputView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        let chat1 = Chat(text: "text1", time: "10:01", userType: .I)
        let chat2 = Chat(text: "text2", time: "10:02", userType: .You)
        let chat3 = Chat(text: "text3", time: "10:03", userType: .I)
        chats = [chat1, chat2, chat3]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = self.chats[indexPath.row]
        if chat.isMyChat() {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyChatCell") as! MyChatTableViewCell
            cell.clipsToBounds = true
            //ToDo：既読のついた人をどうやって判定するか。
            cell.updateCell(text: chat.text, time: chat.time, isRead: true)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "YourChatCellb") as! YourChatTableViewCell
            cell.clipsToBounds = true
            cell.updateCell(text: chat.text, time: chat.time)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10.0
    }
    
}


