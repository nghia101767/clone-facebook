//
//  HomeViewController.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 8/9/20.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: BaseChildViewController {

    @IBOutlet weak var tableHome: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    func initTableView() {
        self.tableHome.register(HeaderCreatePostCell.loadView(), forCellReuseIdentifier: HeaderCreatePostCell.identifier)
        
        self.tableHome.register(HeaderFriendCell.loadView(), forCellReuseIdentifier: HeaderFriendCell.identifier)
            
        self.tableHome.tableFooterView = UIView()
        
        self.tableHome.dataSource = self
        self.tableHome.delegate = self
    }

}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 110
        return UITableView.automaticDimension
    }

}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        switch index {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCreatePostCell.identifier, for: indexPath) as! HeaderCreatePostCell
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderFriendCell.identifier, for: indexPath) as! HeaderFriendCell
            cell.configuration(dataSource: self)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
}
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: HeaderFriendDetailCell.identifier, for: indexPath) as? HeaderFriendDetailCell
        if cell != nil {
            return cell!
        }
        
        return UICollectionViewCell()
    }
    
    
}
