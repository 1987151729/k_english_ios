//
//  SentenceTypeCollectionViewCell.swift
//  App
//
//  Created by kila on 26/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class SentenceTypeCollectionViewCell: UICollectionViewCell {
    
    var uImgBackground: UIImageView!
    var uImg: UIImageView!
    var uLabelName: UILabel!
    var uLabelDescription: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if !self.isEqual(nil) {
            uImgBackground = UIImageView(image: UIImage(named:"icon_rectangle_bg3"))
            uImg = UIImageView(image: UIImage(named:"icon_c"))
            uLabelName = UILabel()
            uLabelDescription = UILabel()
            
            uLabelName.font = UIFont.systemFont(ofSize: 16)
            uLabelName.numberOfLines = 2
            uLabelDescription.font = UIFont.systemFont(ofSize: 12)
            uLabelDescription.numberOfLines = 3
            
            uLabelName.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_WHITE, alpha: 1.0)
            uLabelDescription.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_WHITE, alpha: 1.0)
            
            self.contentView.addSubview(uImgBackground)
            self.contentView.addSubview(uImg)
            self.contentView.addSubview(uLabelName)
            self.contentView.addSubview(uLabelDescription)
            
            uImgBackground.snp.makeConstraints { (make) -> Void in
                make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            }
            
            uImg.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(25)
                make.height.equalTo(25)
                make.top.equalTo(self.contentView).offset(20)
                make.leading.equalTo(self.contentView).offset(30)
            }
            
            uLabelName.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(uImg.snp.bottom).offset(10)
                make.leading.equalTo(self.contentView).offset(30)
                make.trailing.equalTo(self.contentView).offset(-30)
            }
            
            uLabelDescription.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(uLabelName.snp.bottom).offset(10)
                make.leading.equalTo(self.contentView).offset(30)
                make.trailing.equalTo(self.contentView).offset(-30)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
