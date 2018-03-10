//
//  MusicViewController.swift
//  App
//
//  Created by kila on 23/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import MJRefresh
import Kingfisher

class MusicViewController: UIViewController {
    
    // 属性定义
    // 非视图属性
    private var presenter: MusicViewPresenter?
    private var dataList: [Music]!
    private var pageIndex: Int = 1 // 页码
    private let pageSize: Int = 20 // 每页大小
    private let forCellReuseIdentifier: String = "Cell"
    private var expandStateList: [Bool]! // 定义数组存储文本的折叠状态
    // 视图属性（对于视图类的属性，在变量名前面加上一个字符“u”作为区分，便于识别。这是本人个人的习惯。）
    private var uBtnNavRight: UIButton!
    private var uTableView: UITableView?
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
extension MusicViewController {
    
    private func initView() {
        self.view.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        initBody()
    }
    
    private func initBody() {
        // 调整表格的高度，使其不被tabbar遮挡
        let modelName = UIDevice.current.modelName
        var height: CGFloat?
        if "iPhone X" == modelName {
            height = self.view.frame.height - 150
        }
        else {
            height = self.view.frame.height - 130
        }
        // 创建表视图
        self.uTableView = UITableView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: height!), style:.plain)
//        self.uTableView = UITableView()
        self.uTableView!.delegate = self
        self.uTableView!.dataSource = self
        self.uTableView!.separatorStyle = .none
        // 创建一个重用的单元格（用的是哪个类就注册哪个类）
        self.uTableView!.register(MusicTableViewCell.self, forCellReuseIdentifier: forCellReuseIdentifier)
        self.view.addSubview(self.uTableView!)
        // 下拉刷新相关设置
        uHeaderView = MJRefreshNormalHeader()
        self.uTableView!.mj_header = uHeaderView
        // 上拉加载相关设置
        uFooterView = MJRefreshAutoNormalFooter()
        // 是否自动加载（默认为true，即表格滑到底部就自动加载）
        uFooterView?.isAutomaticallyRefresh = true
        self.uTableView!.mj_footer = uFooterView
        
        // 隐藏时间
        uHeaderView?.lastUpdatedTimeLabel.isHidden = true
        // 隐藏状态
        //        uTableHeader?.stateLabel.isHidden = true
        // 刷新时不显示文字（其它情况下还是有提示文字的）
        //        uTableFooter?.isRefreshingTitleHidden = true
    }
}

// 事件绑定
extension MusicViewController {
    
    private func initTarget(){
        // 下拉刷新
        uHeaderView?.setRefreshingTarget(self, refreshingAction: #selector(self.headerRefresh))
        // 上拉加载
        uFooterView?.setRefreshingTarget(self, refreshingAction: #selector(self.footerLoad))
    }
}

// 初始化数据
extension MusicViewController {
    
    private func initData(){
        presenter = MusicViewPresenter.init(viewProtocol: self)
        dataList = [Music]()
        expandStateList = [Bool]()
        headerRefresh()
    }
}

// 事件处理（非数据业务）[实现协议 ]
extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    // 创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let music = self.dataList[indexPath.row]
            // 为了提供表格显示性能，已创建完成的单元需重复使用
            // 同一形式的单元格重复使用，在声明时已注册
            var uCell: MusicTableViewCell = tableView.dequeueReusableCell(withIdentifier: forCellReuseIdentifier, for: indexPath) as! MusicTableViewCell
            
            if uCell.isEqual(nil) {
                uCell = MusicTableViewCell(style: .default, reuseIdentifier: forCellReuseIdentifier)
            }
            //            cell.accessoryType = .disclosureIndicator
            uCell.selectionStyle = .none
            uCell.delegate = self
            uCell.index = indexPath.row
            
            uCell.uImg.kf.setImage(with: URL(string: music.img!))
            uCell.uLabelTitle.text = music.title
            uCell.uViewDescription.contentLabel.text = music.description!
            uCell.uViewDescription.isExpand = self.expandStateList[indexPath.row] // 文本是否展开状态赋值
            
            return uCell
    }
}

// 事件处理（非数据业务）[实现协议 ]
extension MusicViewController: MusicTableViewCellDelegate {
    func onClickBtnExpand(isExpand: Bool, index: Int) {
        self.uTableView?.beginUpdates()
//        self.uTableView?.setNeedsUpdateConstraints()
        self.uTableView?.endUpdates()
        self.expandStateList[index] = isExpand
    }
}

// 事件处理（数据业务）[实现协议 ]
extension MusicViewController: MusicViewProtocol {
    
    func getPageIndex() -> Int {
        return self.pageIndex
    }
    
    func getPageSize() -> Int {
        return self.pageSize
    }
    
    func refresh(list: [Music]) {
        self.dataList = list
        self.expandStateList = [Bool](repeatElement(false, count: list.count))
        // 重新加载表格数据
        self.uTableView!.reloadData()
        // 结束刷新
        self.uTableView!.mj_header.endRefreshing()
        // 判断是否加载完成
        self.uTableView!.mj_footer.resetNoMoreData()
        if self.pageSize > list.count {
            self.uTableView!.mj_footer.endRefreshingWithNoMoreData()
        }
    }
    
    func load(list: [Music]) {
        if 0 < list.count {
            self.dataList = self.dataList + list
            self.expandStateList = self.expandStateList + [Bool](repeatElement(false, count: list.count))
            // 重新加载表格数据
            self.uTableView!.reloadData()
        }
        // 结束刷新
        self.uTableView!.mj_footer.endRefreshing()
        // 判断是否加载完成
        if self.pageSize > list.count {
            self.uTableView!.mj_footer.endRefreshingWithNoMoreData()
        }
    }
}

// 事件处理（数据业务）[功能逻辑]
extension MusicViewController {
    
    // 顶部下拉刷新
    @objc private func headerRefresh(){
        self.pageIndex = 1
        presenter?.refresh()
    }
    
    // 底部上拉加载
    @objc private func footerLoad(){
        self.pageIndex += 1
        presenter?.load()
    }
}

