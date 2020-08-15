//
//  HeaderFriendCell.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 11/08/2020.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit

class HomeNewsCell: UITableViewCell {
    static let identifier = "HomeNewsCell"
        
    @IBOutlet weak var collectionFriend: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func loadView() ->UINib{
        return UINib(nibName: HomeNewsCell.identifier, bundle: nil)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configuration(delegate: (UICollectionView)->Void){
        collectionFriend.register(HeaderNewsDetailCell.loadView(), forCellWithReuseIdentifier: HeaderNewsDetailCell.identifier)
        delegate(collectionFriend)
        collectionFriend.showsHorizontalScrollIndicator = false
    }
}
