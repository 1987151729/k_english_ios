//
//  LoginViewController.swift
//  App
//
//  Created by kila on 28/01/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SnapKit
import Toaster

class LoginViewController: UIViewController {
    
    // 属性定义
    // 非视图属性
    private var presenter: LoginViewPresenter?
    private var username: String?
    private var password: String?
    private var viewFrameOriginY: CGFloat?
    // 视图属性（对于视图类的属性，在变量名前面加上一个字符“u”作为区分，便于识别。这是本人个人的习惯。）
    private var uBtnNavLeft: UIButton!
    private var uViewUsernameBar: UIView!
    private var uViewPasswordBar: UIView!
    private var uViewBtnBar: UIView!
    private var uImgUsernameBarBackground: UIImageView!
    private var uImgPasswordBarBackground: UIImageView!
    private var uImgBtnBarBackground: UIImageView!
    private var uImgIconUsername: UIImageView!
    private var uImgIconPassword: UIImageView!
    private var uTxtUsername: UITextField!
    private var uTxtPassword: UITextField!
    
    private var uBtnLogin: UIButton!
    private var uBtnForgetPassword: UIButton!
    private var uViewLoading: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
        initTarget()
        initData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initData2()
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
extension LoginViewController{
    
    private func initView() {
        self.view.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        initNavigation()
        initBody()
        self.updateViewConstraints()
    }
    
    private func initNavigation() {
        // 标题
        self.navigationItem.title = NSLocalizedString("login_title", comment: "")
        // 左按钮
        uBtnNavLeft = UIButton(frame:CGRect(x: 0, y: 0, width: 18, height: 18))
        uBtnNavLeft.setImage(UIImage(named: "icon_head_back"), for: .normal)
        let barButtonLeft = UIBarButtonItem(customView: uBtnNavLeft)
        self.navigationItem.leftBarButtonItem = barButtonLeft
    }
    
    private func initBody() {
        uViewUsernameBar = UIView()
        uViewPasswordBar = UIView()
        uViewBtnBar = UIView()
        uImgUsernameBarBackground = UIImageView()
        uImgPasswordBarBackground = UIImageView()
        uImgBtnBarBackground = UIImageView()
        uImgIconUsername = UIImageView()
        uImgIconPassword = UIImageView()
        uTxtUsername = UITextField()
        uTxtPassword = UITextField()
        uBtnLogin = UIButton()
        uBtnForgetPassword = UIButton()
        uViewLoading = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        uImgUsernameBarBackground.image = UIImage(named:"icon_txt")
        uImgPasswordBarBackground.image = UIImage(named:"icon_txt")
        uImgIconUsername.image = UIImage(named:"icon_envelope")
        uImgIconPassword.image = UIImage(named:"icon_padlock")
        
        uTxtUsername.backgroundColor = UIColor.clear
        uTxtUsername.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0)
        uTxtUsername.placeholder = NSLocalizedString("login_edit_hint_username", comment: "")
        uTxtUsername.font = UIFont.systemFont(ofSize: 12)
        // 关闭首字母大写功能
        //        uContent.autocorrectionType = .no
        uTxtUsername.autocapitalizationType = .none
        
        uTxtPassword.backgroundColor = UIColor.clear
        uTxtPassword.textColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0)
        uTxtPassword.placeholder = NSLocalizedString("login_edit_hint_password", comment: "")
        uTxtPassword.font = UIFont.systemFont(ofSize: 12)
        // 关闭首字母大写功能
        //        uContent.autocorrectionType = .no
        uTxtPassword.autocapitalizationType = .none
        uTxtPassword.isSecureTextEntry = true // 密码形式
        
        uImgBtnBarBackground.image = UIImage(named:"icon_btn_big")
        
        uBtnLogin.setTitleColor(ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_WHITE, alpha: 1.0), for: .normal)
        uBtnLogin.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        uBtnLogin.setTitle(NSLocalizedString("login_btn_ok", comment: ""), for: .normal)
        
        uBtnForgetPassword.setTitleColor(ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_PRIMARY_MEDIUM, alpha: 1.0), for: .normal)
        uBtnForgetPassword.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        uBtnForgetPassword.setTitle(NSLocalizedString("login_btn_forget_password", comment: ""), for: .normal)
        
        // 等待提示框
        uViewLoading.center = self.view.center
        
        self.view.addSubview(uViewUsernameBar)
        self.view.addSubview(uViewPasswordBar)
        self.view.addSubview(uViewBtnBar)
        self.view.addSubview(uBtnForgetPassword)
        self.view.addSubview(uViewLoading)
        
        uViewUsernameBar.addSubview(uImgUsernameBarBackground)
        uViewUsernameBar.addSubview(uImgIconUsername)
        uViewUsernameBar.addSubview(uTxtUsername)
        
        uViewPasswordBar.addSubview(uImgPasswordBarBackground)
        uViewPasswordBar.addSubview(uImgIconPassword)
        uViewPasswordBar.addSubview(uTxtPassword)
        
        uViewBtnBar.addSubview(uImgBtnBarBackground)
        uViewBtnBar.addSubview(uBtnLogin)
    }
    
    override func updateViewConstraints() {
        // 用户名
        uViewUsernameBar.snp.updateConstraints { (make) -> Void in
            make.height.equalTo(45)
            make.centerY.equalTo(self.view).offset(-50)
            make.leading.equalTo(self.view).offset(10)
            make.trailing.equalTo(self.view).offset(-10)
        }
        
        uImgUsernameBarBackground.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(uViewUsernameBar).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uImgIconUsername.snp.updateConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 22, height: 17))
            make.leading.equalTo(uImgUsernameBarBackground).offset(10)
            make.centerY.equalTo(uImgUsernameBarBackground)
        }
        
        uTxtUsername.snp.updateConstraints { (make) -> Void in
            make.centerY.equalTo(uImgUsernameBarBackground)
            make.top.equalTo(uImgUsernameBarBackground).offset(5)
            make.bottom.equalTo(uImgUsernameBarBackground).offset(-5)
            make.leading.equalTo(uImgIconUsername.snp.trailing).offset(10)
            make.trailing.equalTo(uImgUsernameBarBackground).offset(-20)
        }
        
        // 密码
        uViewPasswordBar.snp.updateConstraints { (make) -> Void in
            make.height.equalTo(45)
            make.top.equalTo(uViewUsernameBar.snp.bottom).offset(10)
            make.leading.equalTo(self.view).offset(10)
            make.trailing.equalTo(self.view).offset(-10)
        }
        
        uImgPasswordBarBackground.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(uViewPasswordBar).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uImgIconPassword.snp.updateConstraints { (make) -> Void in
            make.centerX.equalTo(uImgIconUsername)
            make.centerY.equalTo(uImgPasswordBarBackground)
        }
        
        uTxtPassword.snp.updateConstraints { (make) -> Void in
            make.centerY.equalTo(uImgPasswordBarBackground)
            make.top.equalTo(uImgPasswordBarBackground).offset(5)
            make.bottom.equalTo(uImgPasswordBarBackground).offset(-5)
            make.leading.equalTo(uTxtUsername)
            make.trailing.equalTo(uTxtUsername)
        }
        
        // 确定按钮
        uViewBtnBar.snp.updateConstraints { (make) -> Void in
            make.height.equalTo(70)
            make.top.equalTo(uViewPasswordBar.snp.bottom).offset(20)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
        }
        
        uImgBtnBarBackground.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(uViewBtnBar).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        uBtnLogin.snp.updateConstraints { (make) -> Void in
            make.edges.equalTo(uViewBtnBar).inset(UIEdgeInsetsMake(0, 0, 20, 0))
        }
        
        // 忘记密码
        uBtnForgetPassword.snp.updateConstraints { (make) -> Void in
            make.height.equalTo(15)
            make.top.equalTo(uBtnLogin.snp.bottom).offset(40)
            make.leading.equalTo(self.view).offset(10)
        }
        // according to Apple super should be called at end of method
        super.updateViewConstraints()
    }
}

// 事件绑定
extension LoginViewController{

    private func initTarget(){
        uTxtUsername.delegate = self
        uTxtPassword.delegate = self
        // 点击界面
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:self, action:#selector(self.handleTap(sender:))))
        // 导航栏-返回
        uBtnNavLeft.addTarget(self, action:#selector(self.back), for:.touchUpInside)
        // 登录
        uBtnLogin.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        // 忘记密码
        uBtnForgetPassword.addTarget(self, action: #selector(self.forgetPassword), for: .touchUpInside)
    }
}

// 初始化数据
extension LoginViewController{

    private func initData(){
        presenter = LoginViewPresenter.init(viewProtocol: self)
    }
    
    private func initData2(){
        self.viewFrameOriginY = self.view.frame.origin.y
    }
}

// 事件处理（非数据业务）
extension LoginViewController{

    // 导航栏-返回
    @objc private func back(){
        self.navigationController?.popViewController(animated: true)
    }

    // 点击界面
    @objc private func handleTap(sender: UITapGestureRecognizer) {
        // 收起键盘
        if sender.state == .ended {
            UIView.animate(withDuration: 0.2, animations: {
                self.view.frame.origin.y = self.viewFrameOriginY!
            })
            uTxtUsername.resignFirstResponder()
            uTxtPassword.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }

    // 忘记密码
    @objc private func forgetPassword(){
//        self.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(xxx(), animated: true)
//        self.hidesBottomBarWhenPushed = false
    }
}

// 事件处理（非数据业务）[实现代理UITextFieldDelegate]
extension LoginViewController: UITextFieldDelegate{

    func textField(_ textField:UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool {
        if textField == uTxtUsername {
            // 限制长度
            let length = (textField.text?.lengthOfBytes(using: String.Encoding.utf8))! - range.length + string.lengthOfBytes(using: String.Encoding.utf8)
            if 40 < length{
                return false
            }
        }
        
        if textField == uTxtPassword {
            // 限制长度
            let length = (textField.text?.lengthOfBytes(using: String.Encoding.utf8))! - range.length + string.lengthOfBytes(using: String.Encoding.utf8)
            if 20 < length{
                return false
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.4, animations: {
            self.view.frame.origin.y = self.viewFrameOriginY! - 90
        })
    }
}

// 事件处理（数据业务）[实现协议 LoginViewProtocol]
extension LoginViewController: LoginViewProtocol{

    func getUserName() -> String {
        return self.uTxtUsername.text!
    }

    func getPassword() -> String {
        return self.uTxtPassword.text!
    }

    func showTips(tips: String){
        Toast(text: tips, duration: 1.2).show()
    }

    func showResult(state: Int) {
    }

    func showLoading() {
        uViewLoading.startAnimating()
    }

    func hideLoading() {
        uViewLoading.stopAnimating()
    }
}

// 事件处理（数据业务）[功能逻辑]
extension LoginViewController{

    // 登录
    @objc private func login() {
        presenter?.login()
    }
}

