//
//  HomeViewController.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 8/8/20.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {

    @IBOutlet weak var header: UIView!
    
    @IBOutlet weak var collectionMenu: UICollectionView!
    @IBOutlet weak var body: UIView!
    
    private var pageViewController: UIPageViewController!
    
    private var viewControllers:[UIViewController] = []

    private var currentViewController = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    func initViewController(){
        let home = HomeViewController()
        home.index = 0
        let video = VideoViewController()
        video.index = 1
        let mypage = MyPageViewController()
        mypage.index = 2
        let notifications = NotificationsViewController()
        notifications.index = 3
        
        let menu = MenuViewController();
        menu.index = 4
        
        viewControllers.append(home)
        viewControllers.append(video)
        viewControllers.append(mypage)
        
        viewControllers.append(notifications)
        viewControllers.append(menu)
        
        self.pageViewController = UIPageViewController(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal)
        
        self.pageViewController.dataSource = self
        self.pageViewController.view.frame = body.bounds
        self.pageViewController.setViewControllers([viewControllers[currentViewController]], direction: .reverse, animated: false, completion: nil)
        self.body.addSubview(self.pageViewController.view)
        self.addChild(pageViewController)
        self.pageViewController.didMove(toParent: self)
        
    }
}

extension DefaultViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var i = currentViewController
        if currentViewController == 0{
            i=viewControllers.count-1
        }
        return viewControllers[i]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var i = currentViewController
        if currentViewController == viewControllers.count-1{
            i = 0
        }
        return viewControllers[i]
    }
    
}
