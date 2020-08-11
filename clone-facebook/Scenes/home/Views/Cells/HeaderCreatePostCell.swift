//
//  HeaderCreatePostCell.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 11/08/2020.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit

protocol HeaderCreatePostDelegate {
    
}
class HeaderCreatePostCell: UITableViewCell {
    static let identifier = "HeaderCreatePostCell"
    var delegate: HeaderCreatePostDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func loadView() ->UINib{
        return UINib(nibName: HeaderCreatePostCell.identifier, bundle: nil)
    }
    
    func configuration(delegate: HeaderCreatePostDelegate){
        self.delegate = delegate
    }
    
}
