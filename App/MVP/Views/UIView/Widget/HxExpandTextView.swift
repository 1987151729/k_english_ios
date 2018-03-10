//
//  ExpandTextView.swift
//  App
//
//  Created by kila on 26/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SnapKit

class HxExpandTextView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // 属性定义
    // 非视图属性
    var delegate: HxExpandTextViewDelegate?
    var isExpand: Bool = false {
        didSet{
            self.expandTxt()
        }
    }
    private let numberOfLines: Int = 3
    // 视图属性
    private var uViewItemBox: UIView!
    var contentLabel: UILabel!
    private var btnExpand: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 页面布局
    private func initView() {
        uViewItemBox = UIView()
        contentLabel = UILabel()
        btnExpand = UIButton()
        
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.numberOfLines = numberOfLines
        contentLabel.contentMode = .topLeft
        
        btnExpand.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btnExpand.setTitle(NSLocalizedString("expand_txt_no", comment: ""), for: .normal)
        btnExpand.addTarget(self, action: #selector(self.expand), for: .touchUpInside)
//        btnExpand.backgroundColor = .green
        btnExpand.setTitleColor(ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0), for: .normal)
        
        self.addSubview(uViewItemBox)
        uViewItemBox.addSubview(contentLabel)
        uViewItemBox.addSubview(btnExpand)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        uViewItemBox.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        contentLabel.snp.updateConstraints { (make) in
            make.top.equalTo(uViewItemBox).inset(0)
            make.leading.equalTo(uViewItemBox).inset(0)
            make.trailing.equalTo(uViewItemBox).inset(0)
        }
        
        btnExpand.snp.updateConstraints { (make) in
            make.height.equalTo(20)
            make.top.equalTo(contentLabel.snp.bottom).inset(-5)
            make.leading.equalTo(contentLabel).inset(0)
            make.bottom.equalTo(uViewItemBox).inset(0)
        }
        // according to Apple super should be called at end of method
        super.updateConstraints()
    }
    
    @objc private func expand() {
        if true == isExpand {
            // 展开的，则收起
            isExpand = false
        }
        else {
            // 收起的，则展开
            isExpand = true
        }
//        self.updateConstraints()
        self.delegate?.onClickBtnExpand(isExpand: isExpand)
    }
    
    private func expandTxt() {
        if true == isExpand {
            // 展开
            contentLabel.numberOfLines = 0
            btnExpand.setTitle(NSLocalizedString("expand_txt_yes", comment: ""), for: .normal)
        }
        else {
            // 收起
            contentLabel.numberOfLines = numberOfLines
            btnExpand.setTitle(NSLocalizedString("expand_txt_no", comment: ""), for: .normal)
        }
    }
}

// 代理
protocol HxExpandTextViewDelegate: NSObjectProtocol {
    // 点击事件
    func onClickBtnExpand(isExpand: Bool)
}
