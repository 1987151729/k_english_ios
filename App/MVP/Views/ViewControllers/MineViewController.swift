//
//  MineViewController.swift
//  App
//
//  Created by kila on 06/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    // 属性定义
    // 非视图属性
    private var presenter: MusicViewPresenter?
    private var loginState: Int? = 0 // 0=未登录，1=已登录
    // 视图属性（对于视图类的属性，在变量名前面加上一个字符“u”作为区分，便于识别。这是本人个人的习惯。）
    private var uBtnLogin: UIButton!
    private var uBtnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
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
extension MineViewController{
    
    private func initView() {
        self.view.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        initNavigation()
        initBody()
    }
    
    private func initNavigation() {
        if 0 == loginState {
            // 标题
            self.navigationItem.title = NSLocalizedString("not_login_title", comment: "")
        }
        else {
            // 标题
            self.navigationItem.title = NSLocalizedString("mine_title", comment: "")
            // 右按钮
            let buttonRight = UIButton(frame:CGRect(x:0, y:0, width:18, height:18))
            buttonRight.setImage(UIImage(named: "icon_mine_settings"), for: .normal)
            //        buttonRight.addTarget(self,action:#selector(self.goToxxxxx),for:.touchUpInside)
            let barButtonRight = UIBarButtonItem(customView: buttonRight)
            self.navigationItem.rightBarButtonItem = barButtonRight
        }
    }
    
    private func initBody() {
        if 0 == loginState {
            self.initBodyForNotLoggedIn()
        }
        else {
            self.initBodyForLoggedIn()
        }
        
        self.updateViewConstraints()
    }
    
    // 未登录界面布局
    private func initBodyForNotLoggedIn() {
        uBtnLogin = UIButton()
        uBtnRegister = UIButton()
        
        uBtnLogin.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        uBtnLogin.setTitle(NSLocalizedString("not_login_login", comment: ""), for: .normal)
        uBtnLogin.setTitleColor(ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0), for: .normal)
        uBtnLogin.addTarget(self, action: #selector(self.goToLogin), for: .touchUpInside)
        
        uBtnRegister.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        uBtnRegister.setTitle(NSLocalizedString("not_login_register_email", comment: ""), for: .normal)
        uBtnRegister.setTitleColor(ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0), for: .normal)
        uBtnRegister.addTarget(self, action: #selector(self.goToRegisterEmail), for: .touchUpInside)
        
        self.view.addSubview(uBtnLogin)
        self.view.addSubview(uBtnRegister)
    }
    
    // 已登录界面布局
    private func initBodyForLoggedIn() {
    }
    
    override func updateViewConstraints() {
        if 0 == loginState {
            self.updateViewConstraintsForNotLoggedIn()
        }
        else {
            self.updateViewConstraintsForLoggedIn()
        }
        // according to Apple super should be called at end of method
        super.updateViewConstraints()
    }
    
    private func updateViewConstraintsForNotLoggedIn() {
        uBtnLogin.snp.updateConstraints { (make) in
            make.height.equalTo(20)
            make.centerX.equalTo(self.view).inset(-30)
            make.centerY.equalTo(self.view).inset(10)
        }
        
        uBtnRegister.snp.updateConstraints { (make) in
            make.height.equalTo(20)
            make.centerX.equalTo(self.view).inset(30)
            make.centerY.equalTo(self.view).inset(10)
        }
    }
    
    private func updateViewConstraintsForLoggedIn() {
    }
}

// 事件处理（非数据业务）
extension MineViewController{
    
    @objc private func goToLogin(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    @objc private func goToRegisterEmail(){
        //        self.hidesBottomBarWhenPushed = true
        //        self.navigationController?.pushViewController(BlogPublishViewController(), animated: true)
        //        self.hidesBottomBarWhenPushed = false
    }
    
    @objc private func goToSettings() {

    }
}
