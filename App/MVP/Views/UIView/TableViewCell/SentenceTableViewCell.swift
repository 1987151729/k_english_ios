//
//  SentenceTableViewCell.swift
//  App
//
//  Created by kila on 04/03/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class SentenceTableViewCell: UITableViewCell {
    
    private var uViewItemBox: UIView!
    private var uImgBackground: UIImageView!
    var uImgSpeak: UIImageView!
    var uLabelQuery: UILabel!
    var uLabelTranslation: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initView()
        self.updateConstraints()
    }
    
    private func initView(){
        uViewItemBox = UIView()
        uImgBackground = UIImageView(image: UIImage(named:"icon_rectangle_bg4"))
        uImgSpeak = UIImageView(image: UIImage(named:"icon_speak"))
        uLabelQuery = UILabel()
        uLabelTranslation = UILabel()
        
        uLabelQuery.font = UIFont.systemFont(ofSize: 14)
        uLabelQuery.numberOfLines = 0
        uLabelTranslation.font = UIFont.systemFont(ofSize: 13)
        
        uLabelQuery.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0)
        uLabelTranslation.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0)
        
        self.contentView.addSubview(uViewItemBox)
        uViewItemBox.addSubview(uImgBackground)
        uViewItemBox.addSubview(uImgSpeak)
        uViewItemBox.addSubview(uLabelQuery)
        uViewItemBox.addSubview(uLabelTranslation)
    }
    
    override func updateConstraints() {
        uViewItemBox.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uImgBackground.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(uViewItemBox).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uImgSpeak.snp.updateConstraints { (make) -> Void in
            make.width.equalTo(14)
            make.height.equalTo(14)
            make.top.equalTo(uViewItemBox).offset(20)
            make.leading.equalTo(uViewItemBox).offset(20)
        }
        
        uLabelQuery.snp.updateConstraints { (make) -> Void in
            make.top.equalTo(uViewItemBox).offset(20)
            make.leading.equalTo(uImgSpeak.snp.trailing).offset(10)
            make.trailing.equalTo(uViewItemBox).offset(-20)
        }
        
        uLabelTranslation.snp.updateConstraints { (make) -> Void in
            make.top.equalTo(uLabelQuery.snp.bottom).offset(10)
            make.leading.equalTo(uLabelQuery)
            make.trailing.equalTo(uViewItemBox).offset(-20)
            make.bottom.equalTo(uViewItemBox).offset(-20)
        }
        // according to Apple super should be called at end of method
        super.updateConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
