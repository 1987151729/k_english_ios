//
//  BlogTableViewCell.swift
//  App
//
//  Created by kila on 16/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell {
    
    private var uViewItemBox: UIView!
    private var uImgBackground: UIImageView!
    var uImgAvatar: UIImageView!
    var uLabelName: UILabel!
    var uLabelContent: UILabel!
    var uViewImgs: HxNineGridView!
    private var uViewBottomBox: UIView!
    private var uImgCheck: UIImageView!
    private var uImgComment: UIImageView!
    private var uImgLike: UIImageView!
    var uLabelCheckNum: UILabel!
    var uLabelCommentNum: UILabel!
    var uLabelLikeNum: UILabel!
    var uLabelTime: UILabel!

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
        // 内含cell高度自适应的诀窍！
        uViewItemBox = UIView()
        uImgBackground = UIImageView(image: UIImage(named:"icon_rectangle_bg"))
        uImgAvatar = UIImageView()
        uLabelName = UILabel()
        uLabelContent = UILabel()
        uViewImgs = HxNineGridView()
        uImgCheck = UIImageView(image: UIImage(named:"icon_eyed"))
        uImgComment = UIImageView(image: UIImage(named:"icon_message"))
        uImgLike = UIImageView(image: UIImage(named:"icon_praise"))
        uLabelCheckNum = UILabel()
        uLabelCommentNum = UILabel()
        uLabelLikeNum = UILabel()
        uLabelTime = UILabel()
        
        uLabelName.font = UIFont.systemFont(ofSize: 15)
        uLabelTime.font = UIFont.systemFont(ofSize: 14)
        uLabelContent.font = UIFont.systemFont(ofSize: 16)
        uLabelCheckNum.font = UIFont.systemFont(ofSize: 13)
        uLabelCommentNum.font = UIFont.systemFont(ofSize: 13)
        uLabelLikeNum.font = UIFont.systemFont(ofSize: 13)
        
        uLabelName.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_DARK, alpha: 1.0)
        uLabelTime.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_LIGHT, alpha: 1.0)
        uLabelContent.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_LIGHT, alpha: 1.0)
        uLabelCheckNum.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_LIGHT, alpha: 1.0)
        uLabelCommentNum.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_LIGHT, alpha: 1.0)
        uLabelLikeNum.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_LIGHT, alpha: 1.0)
        
        self.contentView.addSubview(uViewItemBox)
        uViewItemBox.addSubview(uImgBackground)
        uViewItemBox.addSubview(uImgAvatar)
        uViewItemBox.addSubview(uLabelName)
        uViewItemBox.addSubview(uLabelContent)
        uViewItemBox.addSubview(uViewImgs)
        uViewItemBox.addSubview(uLabelTime)
        
        uViewBottomBox = UIView()
        uViewItemBox.addSubview(uViewBottomBox)
        uViewBottomBox.addSubview(uImgCheck)
        uViewBottomBox.addSubview(uImgComment)
        uViewBottomBox.addSubview(uImgLike)
        uViewBottomBox.addSubview(uLabelCheckNum)
        uViewBottomBox.addSubview(uLabelCommentNum)
        uViewBottomBox.addSubview(uLabelLikeNum)
    }
    
    override func updateConstraints() {
        uViewItemBox.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uImgBackground.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(uViewItemBox).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uImgAvatar.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width:45, height:45))
            make.top.equalTo(uViewItemBox).offset(25)
            make.leading.equalTo(uViewItemBox).offset(25)
        }
        
        uLabelName.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(uImgAvatar).offset(-5)
            make.leading.equalTo(uImgAvatar.snp.trailing).offset(5)
        }
        
        uLabelTime.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(uViewItemBox).offset(25)
            make.trailing.equalTo(uViewItemBox).offset(-25)
        }
        
        uLabelContent.numberOfLines = 0
        uLabelContent.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(uImgAvatar.snp.bottom).offset(10)
            make.leading.equalTo(uViewItemBox).offset(25)
            make.trailing.equalTo(uViewItemBox).offset(-25)
        }
        
        uViewImgs.width = Constants.Device.SCREEN_WIDTH - 50 // 减去的值为leading+trailing
        uViewImgs.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(uLabelContent.snp.bottom).offset(10)
            make.leading.equalTo(uViewItemBox).offset(25)
            make.trailing.equalTo(uViewItemBox).offset(-25)
        }
        
        uViewBottomBox.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(25)
            make.top.equalTo(uViewImgs.snp.bottom).offset(10)
            make.leading.equalTo(uViewItemBox)
            make.trailing.equalTo(uViewItemBox)
            make.bottom.equalTo(uViewItemBox).offset(-25)
        }
        
        uImgCheck.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(uViewBottomBox)
            make.leading.equalTo(uViewBottomBox).offset(60)
        }
        
        uImgComment.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(uViewBottomBox)
            make.centerX.equalTo(uViewBottomBox).offset(-5)
        }
        
        uImgLike.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(uViewBottomBox)
            make.trailing.equalTo(uViewBottomBox).offset(-60)
        }
        
        uLabelCheckNum.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(uImgCheck)
            make.centerX.equalTo(uImgCheck).offset(25)
        }
        
        uLabelCommentNum.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(uImgComment)
            make.centerX.equalTo(uImgComment).offset(25)
        }
        
        uLabelLikeNum.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(uImgLike)
            make.centerX.equalTo(uImgLike).offset(25)
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
