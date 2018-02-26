//
//  MainNavigationController.swift
//  App
//
//  Created by kila on 06/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
//        let appearance = UIBarButtonItem.appearance()
//        appearance.setBackButtonTitlePositionAdjustment(UIOffset.init(horizontal: 0.0, vertical: -60), for: .default)
//        self.navigationBar.isTranslucent = true
//        self.navigationBar.barTintColor = UIColor.init(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 0.8)
//        #if swift(>=4.0)
//            self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0), NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0)]
//        #elseif swift(>=3.0)
//            self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0), NSFontAttributeName: UIFont.systemFont(ofSize: 16.0)];
//        #endif
//        self.navigationBar.tintColor = UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0)
//        self.navigationItem.title = ""
        
//        self.navigationBar.isHidden = true // 当使用“navigationBar→tabBarController”模式时，需要在这里控制首页的顶部导航栏是否显示！！！
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
