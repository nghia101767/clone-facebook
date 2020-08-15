//
//  ExtPageViewController.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 13/08/2020.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit

extension UIPageViewController{
    var isPagingEnabled: Bool{
        get{
            return self.scrollView?.isScrollEnabled ?? false
        }
        set{
            self.scrollView?.isScrollEnabled = newValue
        }
    }
    var scrollView: UIScrollView?{
        get{
            return self.view.subviews.first(where: {$0 is UIScrollView}) as? UIScrollView
        }
    }
    
}
