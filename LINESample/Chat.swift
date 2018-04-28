//
//  Chat.swift
//  LINESample
//
//  Created by TakaoAtsushi on 2018/04/28.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit

class Chat: NSObject {

    var text: String = ""
    var time: String = ""
    var usertype: UserType
    
    public init(text: String, time: String, userType: UserType) {
        self.text = text
        self.time = time
        self.usertype = userType
    }
    
    public func isMyChat() -> Bool {
        return usertype == .I
    }
}

public enum UserType {
    case I
    case You
}
