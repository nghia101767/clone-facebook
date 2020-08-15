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

class HeaderNewsDetailCell: UICollectionViewCell {
    static let identifier = "HeaderNewsDetailCell"
    
    var delegate: HeaderFriendDetailProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func loadView() -> UINib{
        return UINib(nibName: HeaderNewsDetailCell.identifier, bundle: nil)
    }
}
