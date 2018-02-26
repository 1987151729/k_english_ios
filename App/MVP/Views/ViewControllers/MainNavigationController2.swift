//
//  MainNavigationController2.swift
//  App
//
//  Created by kila on 08/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class MainNavigationController2: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        let appearance = UIBarButtonItem.appearance()
//        appearance.setBackButtonTitlePositionAdjustment(UIOffset.init(horizontal: 0.0, vertical: -60), for: .default)
        // 半透明的
//        self.navigationBar.isTranslucent = true
        // 背景色
//        self.navigationBar.barTintColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.8)
        // 文字
        #if swift(>=4.0)
            self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0), NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0)]
        #elseif swift(>=3.0)
            self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0), NSFontAttributeName: UIFont.systemFont(ofSize: 16.0)];
        #endif
        // 按钮颜色
        //        self.navigationBar.tintColor = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
        // 标题
        //        self.navigationItem.title = ""
        // 背景图片
        self.navigationBar.setBackgroundImage(UIImage(named: "icon_header"), for: .default)

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
