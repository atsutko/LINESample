//
//  MyChatTableViewCell.swift
//  LINESample
//
//  Created by TakaoAtsushi on 2018/04/28.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var readLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.commentTextView.layer.cornerRadius = 15
        addSubview(MyBallonView(frame: CGRect(x: Int(frame.size.width + 30), y: 0, width: 30, height: 30)))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(text: String, time: String, isRead: Bool) {
        self.commentTextView.text = text
        self.timeLabel.text = time
        self.readLabel.isHidden = !isRead
        
        let frame = CGSize(width: self.frame.width - 8, height: CGFloat.greatestFiniteMagnitude)
        var rect = self.commentTextView.sizeThatFits(frame)
        if rect.width < 30 {
            rect.width = 30
        }
    }
    
}
