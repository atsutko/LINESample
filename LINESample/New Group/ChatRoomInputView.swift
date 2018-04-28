//
//  ChatRoomInputView.swift
//  LINESample
//
//  Created by TakaoAtsushi on 2018/04/28.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit

class ChatRoomInputView: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setFromXib()
        chatTextField.delegate = self
        chatTextField.heightAnchor.constraint(equalToConstant: 52.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setFromXib()
    }
    
    private func setFromXib() {
        let nib = UINib.init(nibName: "ChatRoomInputView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
