//
//  DefaultMenuCell.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 10/08/2020.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit


protocol DefaultMenuDelegate {
    func cellTapped(_ cell: DefaultMenuCell)
}

class DefaultMenuCell: UICollectionViewCell {
    static let identifier = "DefaultMenuCell"
    
    @IBOutlet weak var btnIcon: UIButton!
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var viewActive: UIView!
    
    var index = -1
    private var delegate: DefaultMenuDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func onCellTap(_ sender: UIButton) {
        delegate?.cellTapped(self)
    }
    
    func configuration(current index: Int, cellIndex: Int, iconName: String, delegate: DefaultMenuDelegate){
        self.delegate = delegate
        self.index = cellIndex
        viewActive.isHidden = index != self.index
        btnIcon.isSelected = index == self.index
        tintColor = index != self.index ? .gray : .systemBlue
        self.iconImage.image = UIImage(named: iconName)
    }

}
