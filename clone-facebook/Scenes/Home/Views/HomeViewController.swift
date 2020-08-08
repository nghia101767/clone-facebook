//
//  HomeViewController.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 8/8/20.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var header: UIView!
    
    @IBOutlet weak var collectionMenu: UICollectionView!
    @IBOutlet weak var body: UIView!
    
    weak var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension HomeViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
}
