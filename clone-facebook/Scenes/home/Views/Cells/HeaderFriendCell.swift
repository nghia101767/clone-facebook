//
//  HeaderFriendCell.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 11/08/2020.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit

class HeaderFriendCell: UITableViewCell {
    static let identifier = "HeaderFriendCell"
    
    var friendCellDataSource: UICollectionViewDataSource?
    var friendCellDelegate: UICollectionViewDelegate?
        
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func loadView() ->UINib{
        return UINib(nibName: HeaderFriendCell.identifier, bundle: nil)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configuration(dataSource friendCellDataSource: UICollectionViewDataSource, cellDelegate: UICollectionViewDelegate){
        collectionView.register(HeaderFriendDetailCell.loadView(), forCellWithReuseIdentifier: HeaderFriendDetailCell.identifier)
        
        self.friendCellDelegate = cellDelegate
        self.friendCellDataSource = friendCellDataSource
        collectionView.dataSource = friendCellDataSource
    }
}
