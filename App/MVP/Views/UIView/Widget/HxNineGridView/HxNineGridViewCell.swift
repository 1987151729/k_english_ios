//
//  HxNineGridCellView.swift
//  App
//
//  Created by kila on 19/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SnapKit

// 九宫格视图单元类
class HxNineGridViewCell: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // 除了图片外，还可以添加其他的元素，如按钮等。
    
    var index: Int? // 下标

    lazy var imageView: UIImageView  = {
        let imageView_ = UIImageView()
        imageView_.isUserInteractionEnabled = true
        return imageView_
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 页面布局
    private func initView() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
}
