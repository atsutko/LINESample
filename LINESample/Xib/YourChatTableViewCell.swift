//
//  YourChatTableViewCell.swift
//  LINESample
//
//  Created by TakaoAtsushi on 2018/04/28.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit

class YourChatTableViewCell: UITableViewCell {

    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.commentTextView.layer.cornerRadius = 15// 角を丸める
        self.addSubview(YourBalloonView(frame: CGRect(x: commentTextView.frame.minX-10, y: commentTextView.frame.minY-10, width: 50, height: 50)))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateCell(text: String, time: String) {
        self.commentTextView?.text = text
        self.timeLabel?.text = time
        
        let frame = CGSize(width: self.frame.width, height: CGFloat.greatestFiniteMagnitude)
        var rect = self.commentTextView.sizeThatFits(frame)
        if rect.width < 30 {
            rect.width = 30
        }
    }
    
    
}
