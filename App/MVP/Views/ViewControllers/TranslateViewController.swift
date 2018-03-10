//
//  TranslateViewController.swift
//  App
//
//  Created by kila on 08/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import AVKit
import SnapKit
import KMPlaceholderTextView
import Toaster

class TranslateViewController: UIViewController {
    
    // 属性定义
    // 非视图属性
    private var presenter: TranslateViewPresenter?
    private var type: Int = TranslateType.EnToCh.rawValue
    var translate: Translate?
    // 视图属性（对于视图类的属性，在变量名前面加上一个字符“u”作为区分，便于识别。这是本人个人的习惯。）
    private var uBtnNavLeft: UIButton!
    private var uImgTopBarBackground: UIImageView!
    private var uImgIcon: UIImageView!
    private var uLabelA: UILabel!
    private var uLabelB: UILabel!
    private var uViewTopBar: UIView!
    
    private var uViewContent: UIView!
    private var uImgContentAreaBackground: UIImageView!
    private var uTxtContent: KMPlaceholderTextView!
    private var uTxtResult: UITextView!
    private var uBtnPlay: UIButton!
    private var uBtnBar: UIButton!
    private var uImgBtnIcon: UIImageView!
    private var uAVPlayer: AVPlayer!
    private var uAVPlayerLayer: AVPlayerLayer!
    private var uViewLoading: UIActivityIndicatorView!
    
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
extension TranslateViewController{
    
    private func initView() {
        self.view.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        initNavigation()
        initBody()
        self.updateViewConstraints()
    }
    
    private func initNavigation() {
        // 标题
        self.navigationItem.title = NSLocalizedString("translate_title", comment: "")
        // 左按钮
        uBtnNavLeft = UIButton(frame:CGRect(x:0, y:0, width:18, height:18))
        uBtnNavLeft.setImage(UIImage(named: "icon_head_back"), for: .normal)
        let barButtonLeft = UIBarButtonItem(customView: uBtnNavLeft)
        self.navigationItem.leftBarButtonItem = barButtonLeft
    }
    
    private func initBody() {
        // 翻译类型切换栏部分
        uViewTopBar = UIView()
        uLabelA = UILabel()
        uLabelB = UILabel()

        //        uViewTopBar.backgroundColor = UIColor(patternImage: UIImage(named:"icon_tab_bg")!) // 这种设置背景图片的方式只会平铺
        //        uViewTopBar.layer.contents = UIImage(named:"icon_tab_bg")!.cgImage; // 这种设置背景图片的方式虽然可以拉伸，但是九宫格失效
        
        // 通过添加UIImageView的方式设置背景图片（兼容拉伸和九宫格）
        uImgTopBarBackground = UIImageView(image: UIImage(named:"icon_tab_bg"))
        uImgIcon = UIImageView(image: UIImage(named:"icon_translate_exchange"))
        
        uLabelA.textColor = UIColor(red: 105/255.0, green: 105/255.0, blue: 105/255.0, alpha: 1.0)
        uLabelA.text = NSLocalizedString("translate_txt_en", comment: "")
        uLabelB.textColor = UIColor(red: 105/255.0, green: 105/255.0, blue: 105/255.0, alpha: 1.0)
        uLabelB.text = NSLocalizedString("translate_txt_ch", comment: "")
        
        self.view.addSubview(uViewTopBar)
        uViewTopBar.addSubview(uImgTopBarBackground)
        uViewTopBar.addSubview(uLabelA)
        uViewTopBar.addSubview(uLabelB)
        uViewTopBar.addSubview(uImgIcon)
        

        // 翻译内容部分
        uViewContent = UIView()
        uImgContentAreaBackground = UIImageView(image: UIImage(named:"icon_translate_bg"))
        uTxtContent = KMPlaceholderTextView()
        uBtnPlay = UIButton()
        uTxtResult = UITextView()
        uBtnBar = UIButton()
        uImgBtnIcon = UIImageView(image: UIImage(named:"icon_translate_query"))
        uViewLoading = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        uTxtContent.backgroundColor = UIColor.clear
        uTxtContent.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_WHITE, alpha: 1.0)
        uTxtContent.placeholder = NSLocalizedString("translate_edit_hint_content", comment: "")
        uTxtContent.placeholderColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_WHITE, alpha: 1.0)
        uTxtContent.placeholderFont = UIFont.systemFont(ofSize: 12)
        // 关闭首字母大写功能
        //        uContent.autocorrectionType = .no
        uTxtContent.autocapitalizationType = .none
        
        // 播放按钮
        uBtnPlay.setImage(UIImage(named:"icon_speak2"), for: .normal)
        
        // 翻译结果
        uTxtResult.backgroundColor = UIColor.clear
        uTxtResult.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_WHITE, alpha: 1.0)
        uTxtResult.isEditable = false

        // 翻译按钮
        uBtnBar.setImage(UIImage(named:"icon_translate_btn"), for: .normal)

        // 音频播放
        uAVPlayerLayer = AVPlayerLayer()
        self.view.layer.addSublayer(uAVPlayerLayer)
        
        // 等待提示框
        uViewLoading.center = self.view.center
        
        
        self.view.addSubview(uViewContent)
        uViewContent.addSubview(uImgContentAreaBackground)
        uViewContent.addSubview(uTxtContent)
        uViewContent.addSubview(uBtnPlay)
        uViewContent.addSubview(uTxtResult)
        self.view.addSubview(uBtnBar)
        uBtnBar.addSubview(uImgBtnIcon)
        self.view.addSubview(uViewLoading)
    }
    
    override func updateViewConstraints() {
        // 顶部栏部分
        uViewTopBar.snp.updateConstraints { (make) -> Void in
            make.height.equalTo(49)
            //            make.top.equalTo(self.view).offset(UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.size.height)! + 20) // 注！当设置导航栏透明的时候，需要算上导航栏的高度
            make.top.equalTo(self.view).offset(20) // 注！当设置导航栏不透明的时候，不需要算上导航栏的高度
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
        }
        uImgTopBarBackground.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(uViewTopBar).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        uImgIcon.snp.updateConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width:26, height:16))
            make.center.equalTo(uViewTopBar)
        }
        uLabelA.snp.updateConstraints { (make) -> Void in
            make.centerX.equalTo(uImgIcon).offset(-60)
            make.centerY.equalTo(uImgIcon)
        }
        uLabelB.snp.updateConstraints { (make) -> Void in
            make.centerX.equalTo(uImgIcon).offset(60)
            make.centerY.equalTo(uImgIcon)
        }
        
        
        // 翻译内容部分
        uViewContent.snp.updateConstraints { (make) -> Void in
            make.top.equalTo(uViewTopBar.snp.bottom).offset(10)
            make.leading.equalTo(self.view).offset(40)
            make.trailing.equalTo(self.view).offset(-40)
            make.bottom.equalTo(self.view).offset(-70)
        }
        uImgContentAreaBackground.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(uViewContent).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uTxtContent.snp.updateConstraints { (make) -> Void in
            make.height.equalTo(100)
            make.top.equalTo(uViewContent).offset(20)
            make.leading.equalTo(uViewContent).offset(20)
            make.trailing.equalTo(uViewContent).offset(-20)
        }
        
        uBtnPlay.snp.updateConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width:30, height:25))
            make.top.equalTo(uTxtContent.snp.bottom).offset(20)
            make.leading.equalTo(uViewContent).offset(20)
        }
        
        uTxtResult.snp.updateConstraints { (make) -> Void in
            make.height.equalTo(200)
            make.top.equalTo(uBtnPlay.snp.bottom).offset(10)
            make.leading.equalTo(uViewContent).offset(20)
            make.trailing.equalTo(uViewContent).offset(-20)
        }
        
        uBtnBar.snp.updateConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width:160, height:50))
            make.top.equalTo(uViewContent.snp.bottom).offset(-35)
            make.centerX.equalTo(uViewContent)
        }
        
        uImgBtnIcon.snp.updateConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:20, height:20))
            make.centerX.equalTo(uBtnBar)
            make.centerY.equalTo(uBtnBar).offset(-9)
        }
        
        // according to Apple super should be called at end of method
        super.updateViewConstraints()
    }
}

// 事件绑定
extension TranslateViewController{
    
    private func initTarget(){
        // 点击界面
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:self, action:#selector(self.handleTap(sender:))))
        // 导航栏-返回
        uBtnNavLeft.addTarget(self, action:#selector(self.back), for:.touchUpInside)
        // 切换翻译类型
        let topBarTap = UITapGestureRecognizer(target:self, action:#selector(self.changeTab))
        uViewTopBar.isUserInteractionEnabled = true
        uViewTopBar.addGestureRecognizer(topBarTap)
        // 朗读
        uBtnPlay.addTarget(self, action: #selector(self.play), for: .touchUpInside)
        // 翻译
        uBtnBar.addTarget(self, action: #selector(self.query), for: .touchUpInside)
    }
}

// 初始化数据
extension TranslateViewController{
    
    private func initData(){
        presenter = TranslateViewPresenter.init(viewProtocol: self)
    }
}

// 事件处理（非数据业务）
extension TranslateViewController{
    
    @objc private func back(){
        //        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    // 点击界面
    @objc private func handleTap(sender: UITapGestureRecognizer) {
        // 收起键盘
        if sender.state == .ended {
            uTxtContent.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }
    
    // 切换翻译类型
    @objc private func changeTab() {
        if TranslateType.EnToCh.rawValue==type {
            uLabelA.text = NSLocalizedString("translate_txt_ch", comment: "")
            uLabelB.text = NSLocalizedString("translate_txt_en", comment: "")
            type = TranslateType.ChToEn.rawValue
        }
        else{
            uLabelA.text = NSLocalizedString("translate_txt_en", comment: "")
            uLabelB.text = NSLocalizedString("translate_txt_ch", comment: "")
            type = TranslateType.EnToCh.rawValue
        }
    }
    
    // 播放
    @objc private func play(){
        if nil != self.translate{
            var url: String?
            if TranslateType.EnToCh.rawValue==type {
                url = self.translate?.speakUrl
            }
            else{
                url = self.translate?.tSpeakUrl
            }
            let videoURL =  URL(string: url!)!
            uAVPlayer = AVPlayer(url: videoURL)
            uAVPlayerLayer.player = uAVPlayer
            uAVPlayer.play()
        }
    }
}

// 事件处理（数据业务）[实现协议 TranslateViewProtocol]
extension TranslateViewController: TranslateViewProtocol{
    
    func getContent() -> String {
        return self.uTxtContent.text
    }
    
    func getType() -> Int{
        return self.type
    }
    
    func showTips(tips: String){
        Toast(text: tips, duration: 1.2).show()
    }
    
    func showResult(translate: Translate) {
        self.translate = translate
        uTxtResult.text = translate.translation! + " " + translate.explains!
    }
    
    func showLoading() {
        uViewLoading.startAnimating()
    }
    
    func hideLoading() {
        uViewLoading.stopAnimating()
    }
}

// 事件处理（数据业务）[功能逻辑]
extension TranslateViewController{
    
    // 翻译
    @objc private func query() {
        presenter?.translate()
    }
}
