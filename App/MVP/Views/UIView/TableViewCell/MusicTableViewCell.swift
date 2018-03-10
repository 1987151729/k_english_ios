//
//  MusicTableViewCell.swift
//  App
//
//  Created by kila on 26/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    var delegate: MusicTableViewCellDelegate?
    var index: Int? // 下标
    
    private var uViewItemBox: UIView!
    private var uImgBackground: UIImageView!
    var uImg: UIImageView!
    var uLabelTitle: UILabel!
    var uViewDescription: HxExpandTextView!

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
        uImg = UIImageView()
        uLabelTitle = UILabel()
        uViewDescription = HxExpandTextView()
        
        uLabelTitle.font = UIFont.systemFont(ofSize: 16)
        uLabelTitle.numberOfLines = 1
        uViewDescription.contentLabel.font = UIFont.systemFont(ofSize: 14)
        
        uLabelTitle.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0)
        uViewDescription.contentLabel.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0)
        uViewDescription.delegate = self
        
        self.contentView.addSubview(uViewItemBox)
        uViewItemBox.addSubview(uImgBackground)
        uViewItemBox.addSubview(uImg)
        uViewItemBox.addSubview(uLabelTitle)
        uViewItemBox.addSubview(uViewDescription)
    }
    
    override func updateConstraints() {
        uViewItemBox.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uImgBackground.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(uViewItemBox).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uImg.snp.updateConstraints { (make) -> Void in
            make.width.equalTo(120)
            make.height.equalTo(120)
            make.top.equalTo(uViewItemBox).offset(20)
            make.leading.equalTo(uViewItemBox).offset(20)
            make.bottom.lessThanOrEqualTo(uViewItemBox).offset(-20)
        }
        
        uLabelTitle.snp.updateConstraints { (make) -> Void in
            make.top.equalTo(uViewItemBox).offset(20)
            make.leading.equalTo(uImg.snp.trailing).offset(10)
            make.trailing.equalTo(uViewItemBox).offset(-10)
        }
        
        uViewDescription.snp.updateConstraints { (make) -> Void in
            make.top.equalTo(uViewItemBox).offset(42)
            make.leading.equalTo(uLabelTitle)
            make.trailing.equalTo(uViewItemBox).offset(-20)
            make.bottom.lessThanOrEqualTo(uViewItemBox).offset(-20)
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

// 事件处理（非数据业务）[实现协议 ]
extension MusicTableViewCell: HxExpandTextViewDelegate {
    func onClickBtnExpand(isExpand: Bool) {
//        self.updateConstraints()
        self.delegate?.onClickBtnExpand(isExpand: isExpand, index: self.index!)
    }
}

// 代理
protocol MusicTableViewCellDelegate: NSObjectProtocol {
    // 点击事件
    func onClickBtnExpand(isExpand: Bool, index: Int)
}
