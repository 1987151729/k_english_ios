//
//  BlogPublishViewController.swift
//  App
//
//  Created by kila on 08/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class BlogPublishViewController: UIViewController {

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
extension BlogPublishViewController{
    
    func initView() {
        self.view.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        initNavigation()
}
    
    func initNavigation() {
        // 标题
        self.navigationItem.title = NSLocalizedString("blog_publish_title", comment: "")
        // 左按钮
        let buttonLeft = UIButton(frame:CGRect(x:0, y:0, width:18, height:18))
        buttonLeft.setImage(UIImage(named: "icon_head_back"), for: .normal)
        buttonLeft.addTarget(self,action:#selector(self.back),for:.touchUpInside)
        let barButtonLeft = UIBarButtonItem(customView: buttonLeft)
        self.navigationItem.leftBarButtonItem = barButtonLeft
        // 右按钮
        let buttonRight = UIButton(frame:CGRect(x:0, y:0, width:18, height:18))
        buttonRight.setImage(UIImage(named: "icon_publish"), for: .normal)
        buttonRight.addTarget(self,action:#selector(self.publish),for:.touchUpInside)
        let barButtonRight = UIBarButtonItem(customView: buttonRight)
        self.navigationItem.rightBarButtonItem = barButtonRight
    }
}

// 事件处理
extension BlogPublishViewController{
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func publish() {

    }
}
