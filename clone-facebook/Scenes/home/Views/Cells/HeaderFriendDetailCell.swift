//
//  HeaderFriendDetailCell.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 11/08/2020.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit

protocol HeaderFriendDetailProtocol{
    
}

class HeaderFriendDetailCell: UICollectionViewCell {
    static let identifier = "HeaderFriendDetailCell"
    
    var delegate: HeaderFriendDetailProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func loadView() -> UINib{
        return UINib(nibName: HeaderFriendDetailCell.identifier, bundle: nil)
    }
}
