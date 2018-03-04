//
//  FindViewController.swift
//  App
//
//  Created by kila on 06/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SnapKit
import PagingMenuController

class FindViewController: UIViewController {
    
    // 属性定义
    // 非视图属性
    private var pagingMenuController: PagingMenuController!
    // 视图属性（对于视图类的属性，在变量名前面加上一个字符“u”作为区分，便于识别。这是本人个人的习惯。）
    
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
extension FindViewController{
    
    func initView() {
        self.view.backgroundColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        initNavigation()
        initTabBar()
    }
    
    func initNavigation() {
        // 标题
        self.navigationItem.title = NSLocalizedString("main_tab_find", comment: "")
    }
    
    func initTabBar() {
        // 添加一个背景图片
        let uImgBackground = UIImageView(image: UIImage(named:"icon_tab_bg"))
        self.view.addSubview(uImgBackground)
        uImgBackground.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50)
            make.top.equalTo(self.view).inset(10)
            make.leading.equalTo(self.view).inset(5)
            make.trailing.equalTo(self.view).inset(5)
        }
        
        //分页菜单配置
        let options = PagingMenuOptions()
        //分页菜单控制器初始化
        pagingMenuController = PagingMenuController(options: options)
        
        //分页菜单控制器尺寸设置
        pagingMenuController.view.frame.origin.y += 10
        pagingMenuController.view.frame.size.height -= 46
        
        //建立父子关系
        self.addChildViewController(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        self.view.addSubview(pagingMenuController.view)
    }
    
    //分页菜单配置
    private struct PagingMenuOptions: PagingMenuControllerCustomizable {
        //默认显示页
        var defaultPage: Int = 0 // 下标从0开始
        
        //页面切换动画播放时间（秒）
        var animationDuration: TimeInterval = 0.3
        
        //是否允许手指左右滑动页面切换
        var isScrollEnabled: Bool = true
        
        //页面背景色
        var backgroundColor: UIColor = ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY_WHITE, alpha: 1.0)
        
        //lazy loading的页面数量（默认值就是.three）
        var lazyLoadingPage: LazyLoadingPage = .three
        
        //不太清楚干嘛用的（默认值就是.multiple）
        var menuControllerSet: MenuControllerSet = .multiple
        
        //子视图控制器
        let viewController1 = WordTypeViewController()
        let viewController2 = SentenceTypeViewController()
        let viewController3 = MusicViewController()
        
        //组件类型
        fileprivate var componentType: ComponentType {
            return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
        }
        
        //所有子视图控制器
        fileprivate var pagingControllers: [UIViewController] {
            return [viewController1, viewController2, viewController3]
        }
        
        //菜单配置项
        fileprivate struct MenuOptions: MenuViewCustomizable {
            //设置未选中的菜单标签背景色
            var backgroundColor: UIColor = .clear
            
            //设置选中的菜单标签背景色
            var selectedBackgroundColor: UIColor = .lightText
            
            //设置菜单标签高度
            var height: CGFloat = 50
            
            //菜单切换动画播放时间（秒）
            var animationDuration: TimeInterval = 0.3
            
            //菜单切换动画减速率（默认为：UIScrollViewDecelerationRateFast）
            var deceleratingRate: CGFloat = UIScrollViewDecelerationRateFast
            
            //不知道干嘛的
            var menuSelectedItemCenter: Bool = false
            
            //菜单显示模式
            var displayMode: MenuDisplayMode {
                return .segmentedControl
            }
            
            //选中项为橙色矩形背景
            var focusMode: MenuFocusMode = .roundRect(radius: 16,
                                                      horizontalPadding: 10,
                                                      verticalPadding: 8,
                                                      selectedColor: ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_PRIMARY, alpha: 0.8))
            //不知道干嘛的
            var dummyItemViewsSet: Int = 3
            
            //设置菜单栏在下方
            var menuPosition: MenuPosition = .top
            
            //设置标签间的分隔图片
            //        var dividerImage: UIImage? = UIImage(named: "dividerImage.png")!
            
            //菜单项
            var itemsOptions: [MenuItemViewCustomizable] {
                return [MenuItem1(), MenuItem2(), MenuItem3()]
            }
        }
        
        //菜单项
        fileprivate struct MenuItem1: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: NSLocalizedString("find_tab_a", comment: ""),
                                                 color: ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_TAB_NORMAL, alpha: 1.0),
                                                 selectedColor: ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_TAB_FOCUSED, alpha: 1.0),
                                                 font: UIFont.systemFont(ofSize: 18)
                                                 ))
            }
        }
        
        //菜单项
        fileprivate struct MenuItem2: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: NSLocalizedString("find_tab_b", comment: ""),
                                                 color: ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_TAB_NORMAL, alpha: 1.0),
                                                 selectedColor: ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_TAB_FOCUSED, alpha: 1.0),
                                                 font: UIFont.systemFont(ofSize: 18)
                ))
            }
        }
        
        //菜单项
        fileprivate struct MenuItem3: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: NSLocalizedString("find_tab_c", comment: ""),
                                                 color: ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_TAB_NORMAL, alpha: 1.0),
                                                 selectedColor: ColorUtil.rgbColorFromHex(hex: Constants.Colors.COLOR_TXT_TAB_FOCUSED, alpha: 1.0),
                                                 font: UIFont.systemFont(ofSize: 18)
                ))
            }
        }
    }
}

// 事件绑定
extension FindViewController{
    
    func initTarget(){
        pagingMenuController.onMove = {
            state in
            switch state {
            case let .willMoveItem(menuItemView, previousMenuItemView):
                print("--- 标签将要切换 ---")
                print("老标签：\(previousMenuItemView.titleLabel.text!)")
                print("新标签：\(menuItemView.titleLabel.text!)")
            case let .didMoveItem(menuItemView, previousMenuItemView):
                print("--- 标签切换完毕 ---")
                print("老标签：\(previousMenuItemView.titleLabel.text!)")
                print("新标签：\(menuItemView.titleLabel.text!)")
            case let .willMoveController(menuController, previousMenuController):
                print("--- 页面将要切换 ---")
                print("老页面：\(previousMenuController)")
                print("新页面：\(menuController)")
            case let .didMoveController(menuController, previousMenuController):
                print("--- 页面切换完毕 ---")
                print("老页面：\(previousMenuController)")
                print("新页面：\(menuController)")
            case .didScrollStart:
                print("--- 分页开始左右滑动 ---")
            case .didScrollEnd:
                print("--- 分页停止左右滑动 ---")
                //            default:
                //                print("")
            }
        }
    }
}
