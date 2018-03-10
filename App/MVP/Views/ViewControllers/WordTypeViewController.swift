//
//  WordTypeViewController.swift
//  App
//
//  Created by kila on 23/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import MJRefresh

class WordTypeViewController: UIViewController {
    
    // 属性定义
    // 非视图属性
    private var presenter: WordTypeViewPresenter?
    private var dataList: [WordType]!
    private var pageIndex: Int = 1 // 页码
    private let pageSize: Int = 20 // 每页大小
    private let forCellReuseIdentifier: String = "Cell"
    // 视图属性（对于视图类的属性，在变量名前面加上一个字符“u”作为区分，便于识别。这是本人个人的习惯。）
    private var uCollectionView: UICollectionView?
    private var uHeaderView: MJRefreshNormalHeader? // 顶部刷新
    private var uFooterView: MJRefreshAutoNormalFooter? // 底部加载
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initView()
        initTarget()
        initData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

// 界面布局
extension WordTypeViewController {
    
    private func initView() {
        self.view.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        initBody()
    }
    
    private func initBody() {
        // 调整表格的高度，使其不被tabbar遮挡
        let modelName = UIDevice.current.modelName
        var height: CGFloat?
        if "iPhone X" == modelName {
            height = self.view.frame.height - 180
        }
        else {
            height = self.view.frame.height - 140
        }
        // 创建表视图
        let uCollectionViewFlowLayout = UICollectionViewFlowLayout()
        self.uCollectionView = UICollectionView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y + 5, width: self.view.frame.width, height: height!), collectionViewLayout: uCollectionViewFlowLayout)
        self.uCollectionView!.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        self.uCollectionView!.delegate = self
        self.uCollectionView!.dataSource = self
        // 创建一个重用的单元格（用的是哪个类就注册哪个类）
        self.uCollectionView?.register(WordTypeCollectionViewCell.self, forCellWithReuseIdentifier: forCellReuseIdentifier)
        self.view.addSubview(self.uCollectionView!)
        // 下拉刷新相关设置
        uHeaderView = MJRefreshNormalHeader()
        self.uCollectionView!.mj_header = uHeaderView
        //        // 上拉加载相关设置
        //        uFooterView = MJRefreshAutoNormalFooter()
        //        // 是否自动加载（默认为true，即表格滑到底部就自动加载）
        //        uFooterView?.isAutomaticallyRefresh = true
        //        self.uCollectionView!.mj_footer = uFooterView
        
        // 隐藏时间
        uHeaderView?.lastUpdatedTimeLabel.isHidden = true
        // 隐藏状态
        //        uTableHeader?.stateLabel.isHidden = true
        // 刷新时不显示文字（其它情况下还是有提示文字的）
        //        uTableFooter?.isRefreshingTitleHidden = true
    }
}

// 事件绑定
extension WordTypeViewController {
    
    private func initTarget(){
        // 下拉刷新
        uHeaderView?.setRefreshingTarget(self, refreshingAction: #selector(self.headerRefresh))
        // 上拉加载
        uFooterView?.setRefreshingTarget(self, refreshingAction: #selector(self.footerLoad))
    }
}

// 初始化数据
extension WordTypeViewController {
    
    private func initData(){
        presenter = WordTypeViewPresenter.init(viewProtocol: self)
        dataList = [WordType]()
        headerRefresh()
    }
}

// 事件处理（非数据业务）[实现协议 ]
extension WordTypeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 分区数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 每个分区含有的 item 个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    // 返回 cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let wordType = self.dataList[indexPath.row]
        // 为了提供表格显示性能，已创建完成的单元需重复使用
        // 同一形式的单元格重复使用，在声明时已注册
        let uCell = collectionView.dequeueReusableCell(withReuseIdentifier: forCellReuseIdentifier, for: indexPath) as! WordTypeCollectionViewCell
        
        uCell.uLabelName.text = wordType.name
        uCell.uLabelDescription.text = wordType.description
        if 0 == indexPath.row {
            uCell.uImgBackground.image = UIImage(named:"icon_rectangle_bg2")
        }
        else {
            uCell.uImgBackground.image = UIImage(named:"icon_rectangle_bg3")
        }
        
        return uCell
    }
    
    // 每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 5, 10, 5)
    }
    
    // 最小item间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // 最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // item的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (Constants.Device.SCREEN_WIDTH - 5 - 5 * 2)/2
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
    
    // item 对应的点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let wordType = self.dataList[indexPath.row]
        let viewController = WordViewController()
        viewController.type = wordType.type!
        viewController.name = wordType.name
        Constants.Instance.findViewController?.pushViewController(viewController: viewController, animated: true)
    }
}

// 事件处理（数据业务）[实现协议 ]
extension WordTypeViewController: WordTypeViewProtocol {
    
    func getPageIndex() -> Int {
        return self.pageIndex
    }
    
    func getPageSize() -> Int {
        return self.pageSize
    }
    
    func refresh(list: [WordType]) {
        self.dataList = list
        // 重新加载表格数据
        self.uCollectionView!.reloadData()
        // 结束刷新
        self.uCollectionView!.mj_header.endRefreshing()
    }
    
    func load(list: [WordType]) {
        if 0 < list.count {
            self.dataList = self.dataList + list
            // 重新加载表格数据
            self.uCollectionView!.reloadData()
        }
        // 结束刷新
        self.uCollectionView!.mj_footer.endRefreshing()
    }
}

// 事件处理（数据业务）[功能逻辑]
extension WordTypeViewController {
    
    // 顶部下拉刷新
    @objc func headerRefresh(){
        self.pageIndex = 1
        presenter?.refresh()
    }
    
    // 底部上拉加载
    @objc func footerLoad(){
        self.pageIndex += 1
        presenter?.load()
    }
}
