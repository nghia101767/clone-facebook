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
    
    weak var pageViewController: UIPageViewController!
    
    private var viewControllers:[Int:UIViewController] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    func initViewController(){
        
    }
}

extension DefaultViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
}
