//
//  MineViewController.swift
//  App
//
//  Created by kila on 06/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

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
    }
    
    private func initNavigation() {
        // 标题
        self.navigationItem.title = NSLocalizedString("main_tab_mine", comment: "")
        // 右按钮
        let buttonRight = UIButton(frame:CGRect(x:0, y:0, width:18, height:18))
        buttonRight.setImage(UIImage(named: "icon_mine_settings"), for: .normal)
        buttonRight.addTarget(self,action:#selector(self.goToxxxxx),for:.touchUpInside)
        let barButtonRight = UIBarButtonItem(customView: buttonRight)
        self.navigationItem.rightBarButtonItem = barButtonRight
    }
}

// 事件处理
extension MineViewController{
    
    @objc private func goToxxxxx(){
//        self.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(BlogPublishViewController(), animated: true)
//        self.hidesBottomBarWhenPushed = false
    }
}
