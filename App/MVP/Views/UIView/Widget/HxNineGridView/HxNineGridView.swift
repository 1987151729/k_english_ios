//
//  HxNineGridView.swift
//  App
//
//  Created by kila on 19/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

// 九宫格视图类
class HxNineGridView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var delegate: HxNineGridViewDelegate?
    
    // 以下属性均为默认值，可外部赋值进行修改
    var topSpace: CGFloat = 0 // 顶部间隙
    var bottomSpace: CGFloat = 0 // 底部间隙
    var leadingSpace: CGFloat = 0 // 左边间隙
    var trailingSpace: CGFloat = 0 // 右边间隙
    var middleSpace: CGFloat = 5 // 中间间隙
    var width: CGFloat = 320 // NineGridView宽度（根据屏幕宽和当前HxNineGridView需要展示的真实宽度进行调整）
    var isTwoRowsTwoColumns: Bool = true  // 当4张照片时是否采用2行2列排版
    
    var viewBox: UIView!
    
    // 图片列表
    var imageSrcs: [String] = [String]() {
        didSet {
            addCellViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addCellViews() {
        if nil != viewBox {
            viewBox.removeFromSuperview() // 这一步很重要，tablecell重用的时候，需要刷新控件（即把旧的内容清除掉）
        }
        
        let count = self.imageSrcs.count
        if 0<count {
            viewBox = UIView()
            self.addSubview(viewBox)
            
            viewBox.snp.makeConstraints { (make) in
                make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            }
        
            var index: Int = 0
            var cellWidth: CGFloat = 110
            var cellHeight: CGFloat = 110
            var x: CGFloat?
            var y: CGFloat?
            
            /* 注！这里按HxNineGridView中心进行排版 */
            
            // 求出第2个的中心坐标x
            let centerX: CGFloat = self.width/2
            // 求出每个cell的宽高
            cellWidth = (self.width - leadingSpace - trailingSpace - (middleSpace * 2))/3
            cellHeight = cellWidth
            // 求出第1个的中心坐标x,y
            let centerX0 = centerX - cellWidth - middleSpace
            let centerY0 = (cellHeight/2) + topSpace
            
            var rows: Int = 3
            var columns: Int = 3
            
            if 4 == count && self.isTwoRowsTwoColumns {
                rows = 2
                columns = 2
            }
            
            // 构造九宫格
            for i in 0..<rows {
                for j in 0..<columns {
                    // 每个cell的中心坐标x,y
                    x = centerX0 + CGFloat(j) * (cellWidth + middleSpace)
                    y = centerY0 + CGFloat(i) * (cellHeight + middleSpace)
                    
                    // 创建cell视图
                    let cell = HxNineGridViewCell()
                    cell.index = index
                    // 添加图片点击事件
                    let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTapImageView(_:)))
                    cell.imageView.kf.setImage(with: URL(string: self.imageSrcs[index]))
                    cell.imageView.addGestureRecognizer(tap)
                    viewBox.addSubview(cell)
                    
                    cell.snp.makeConstraints { (make) in
                        make.centerX.equalTo(x!)
                        make.centerY.equalTo(y!)
                        make.width.equalTo(cellWidth)
                        make.height.equalTo(cellHeight)
                    }
                    
                    index += 1
                    if index==count{
                        cell.snp.makeConstraints { (make) in
                            make.bottom.equalTo(viewBox.snp.bottom).offset(-bottomSpace)
                        }
                        break
                    }
                }
                if index==count{
                    break
                }
            }
        }
    }
    
    @objc func onTapImageView(_ sender: UITapGestureRecognizer) {
        if let view = sender.view?.superview as? HxNineGridViewCell {
            self.delegate?.onClickImageView(imageSrcs: self.imageSrcs, index: view.index!)
        }
    }
}

// 代理
protocol HxNineGridViewDelegate: NSObjectProtocol {
    // 图片点击事件
    func onClickImageView(imageSrcs: [String], index: Int)
}
