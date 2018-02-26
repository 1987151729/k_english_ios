//
//  WordTypeCollectionViewCell.swift
//  App
//
//  Created by kila on 24/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class WordTypeCollectionViewCell: UICollectionViewCell {

    var uImgBackground: UIImageView!
    var uImgLogo: UIImageView!
    var uLabelName: UILabel!
    var uLabelDescription: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if !self.isEqual(nil) {
            uImgBackground = UIImageView(image: UIImage(named:"icon_rectangle_bg3"))
            uImgLogo = UIImageView(image: UIImage(named:"icon_c"))
            uLabelName = UILabel()
            uLabelDescription = UILabel()
            
            uLabelName.font = UIFont.systemFont(ofSize: 18)
            uLabelDescription.font = UIFont.systemFont(ofSize: 14)
            
            uLabelName.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_WHITE, alpha: 1.0)
            uLabelDescription.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_WHITE, alpha: 1.0)
            
            self.contentView.addSubview(uImgBackground)
            self.contentView.addSubview(uImgLogo)
            self.contentView.addSubview(uLabelName)
            self.contentView.addSubview(uLabelDescription)
            
            uImgBackground.snp.makeConstraints { (make) -> Void in
                make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            }
            
            uImgLogo.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(25)
                make.height.equalTo(25)
                make.top.equalTo(self.contentView).offset(20)
                make.leading.equalTo(self.contentView).offset(30)
            }
            
            uLabelName.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(uImgLogo.snp.bottom).offset(10)
                make.leading.equalTo(self.contentView).offset(30)
            }
            
            uLabelDescription.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(uLabelName.snp.bottom).offset(10)
                make.leading.equalTo(self.contentView).offset(30)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
