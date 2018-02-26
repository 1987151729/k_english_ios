//
//  MainViewController.swift
//  App
//
//  Created by kila on 28/01/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class MainViewController: ESTabBarController {

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
extension MainViewController{
    
    func initView() {
        initTabBar()
    }
    
    func initTabBar() {
        let tabBarController = self // ESTabBarController()
        tabBarController.delegate = nil
        
//        tabBarController.title = "Irregularity"
//        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
//        tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
        tabBarController.tabBar.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in

//            switch index {
//            case 0:
//                tabBarController.title = NSLocalizedString("main_tab_home", comment: "")
//            case 1:
//                tabBarController.title = NSLocalizedString("main_tab_find", comment: "")
////            case 2:
////                tabBarController.title = ""
//            case 3:
//                tabBarController.title = NSLocalizedString("main_tab_news", comment: "")
//            case 4:
//                tabBarController.title = NSLocalizedString("main_tab_mine", comment: "")
//            default:
//                tabBarController.title = tabBarController.title
//            }

            if index == 2 {
                return true
            }
            return false
        }
        tabBarController.didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in
            let nav = MainNavigationController2.init(rootViewController: TranslateViewController())
            tabBarController?.present(nav, animated: true, completion: nil)
        }

        let v1 = BlogViewController()
        let v2 = FindViewController()
        let v3 = UIViewController()
        let v4 = NewsViewController()
        let v5 = MineViewController()

        v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: nil, image: UIImage(named: "tab_main_home"), selectedImage: UIImage(named: "tab_main_home_focused"))
        v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: nil, image: UIImage(named: "tab_main_find"), selectedImage: UIImage(named: "tab_main_find_focused"))
        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "tab_main_center"), selectedImage: UIImage(named: "tab_main_center"))
        v4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: nil, image: UIImage(named: "tab_main_news"), selectedImage: UIImage(named: "tab_main_news_focused"))
        v5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: nil, image: UIImage(named: "tab_main_mine"), selectedImage: UIImage(named: "tab_main_mine_focused"))

        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let n1 = MainNavigationController2.init(rootViewController: v1)
        let n2 = MainNavigationController2.init(rootViewController: v2)
        let n3 = MainNavigationController2.init(rootViewController: v3)
        let n4 = MainNavigationController2.init(rootViewController: v4)
        let n5 = MainNavigationController2.init(rootViewController: v5)

//        v1.title = "a"
//        v2.title = "b"
//        v3.title = "c"
//        v4.title = "d"
//        v5.title = "e"

        tabBarController.viewControllers = [n1, n2, n3, n4, n5]
    }
}


