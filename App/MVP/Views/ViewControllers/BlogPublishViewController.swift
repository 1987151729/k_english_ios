//
//  BlogPublishViewController.swift
//  App
//
//  Created by kila on 08/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class BlogPublishViewController: UIViewController {
    
    // 属性定义
    // 非视图属性
    
    // 视图属性（对于视图类的属性，在变量名前面加上一个字符“u”作为区分，便于识别。这是本人个人的习惯。）
    private var uBtnNavLeft: UIButton!
    private var uBtnNavRight: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
        initTarget()
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
extension BlogPublishViewController{
    
    private func initView() {
        self.view.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        initNavigation()
    }
    
    private func initNavigation() {
        // 标题
        self.navigationItem.title = NSLocalizedString("blog_publish_title", comment: "")
        // 左按钮
        uBtnNavLeft = UIButton(frame:CGRect(x:0, y:0, width:18, height:18))
        uBtnNavLeft.setImage(UIImage(named: "icon_head_back"), for: .normal)
        uBtnNavLeft.addTarget(self,action:#selector(self.back),for:.touchUpInside)
        let barButtonLeft = UIBarButtonItem(customView: uBtnNavLeft)
        self.navigationItem.leftBarButtonItem = barButtonLeft
        // 右按钮
        uBtnNavRight = UIButton(frame:CGRect(x:0, y:0, width:18, height:18))
        uBtnNavRight.setImage(UIImage(named: "icon_publish"), for: .normal)
        
        let barButtonRight = UIBarButtonItem(customView: uBtnNavRight)
        self.navigationItem.rightBarButtonItem = barButtonRight
    }
}


// 事件绑定
extension BlogPublishViewController {
    
    private func initTarget(){
        // 返回
        uBtnNavLeft.addTarget(self,action:#selector(self.back),for:.touchUpInside)
        // 发布
        uBtnNavRight.addTarget(self,action:#selector(self.publish),for:.touchUpInside)
    }
}

// 事件处理
extension BlogPublishViewController{
    
    @objc private func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func publish() {

    }
}
