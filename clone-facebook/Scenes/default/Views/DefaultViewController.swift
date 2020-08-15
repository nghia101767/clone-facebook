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

    private var currentViewControllerIndex = 0
    
    let defaultMenuData: [String] = [
        "home",
        "video",
        "profile",
        "bell",
        "menu",
    ]
    
    @IBOutlet weak var marginTopHeader: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDefaultMenu()
        self.initViewController()
    }
    func initDefaultMenu(){
        collectionMenu.register(UINib(nibName: "DefaultMenuCell", bundle: nil), forCellWithReuseIdentifier: DefaultMenuCell.identifier)
        
        collectionMenu.dataSource = self
        collectionMenu.delegate = self
        
    }
    func reloadMenu(_ row: Int){
        collectionMenu.reloadItems(at: [IndexPath(row: row, section: 0)])
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
        self.pageViewController.setViewControllers([viewControllers[currentViewControllerIndex]], direction: .reverse, animated: false, completion: nil)
        self.body.addSubview(self.pageViewController.view)
        self.addChild(pageViewController)
        self.pageViewController.didMove(toParent: self)
        self.pageViewController.isPagingEnabled = false
    }
}

extension DefaultViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = currentViewControllerIndex - 1
        if currentViewControllerIndex == 0{
            index=viewControllers.count-1
        }
        return viewControllers[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = currentViewControllerIndex + 1
        if currentViewControllerIndex == viewControllers.count-1{
            index = 0
        }
        return viewControllers[index]
    }
    
}

extension DefaultViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return defaultMenuData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionMenu.dequeueReusableCell(withReuseIdentifier: DefaultMenuCell.identifier, for: indexPath) as! DefaultMenuCell
        
        cell.configuration(current: currentViewControllerIndex, cellIndex: indexPath.row, iconName: defaultMenuData[indexPath.row], delegate: self)
        
        return cell
    }
    
}

extension DefaultViewController: UICollectionViewDelegate{
    
}
extension DefaultViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionMenu.frame.width/CGFloat(defaultMenuData.count), height: collectionMenu.frame.height)
    }
}

extension DefaultViewController: DefaultMenuDelegate{
    func cellTapped(_ cell: DefaultMenuCell) {
        let oldIndex = currentViewControllerIndex
        currentViewControllerIndex = cell.index
        reloadMenu(oldIndex)
        reloadMenu(currentViewControllerIndex)
        pageViewController.setViewControllers([viewControllers[currentViewControllerIndex]], direction: .forward, animated: false, completion: nil)
        if cell.index == 0 {
            self.marginTopHeader.constant = 0.0
            self.header.isHidden = false
        }else{
            self.marginTopHeader.constant = -45.0
            self.header.isHidden = true
        }
    }
}
