//
//  SSMenuCell.swift
//  SSSideMenu
//
//  Created by Kunjal Soni on 08/01/20.
//  Copyright © 2020 Kunjal Soni. All rights reserved.
//

import UIKit

open class SSMenuCell: UITableViewCell {
    
    // MARK: -
    // MARK: - Variables
    
    private let iconImageView = UIImageView()
    private let label = UILabel()
    public var config = SSMenuCellConfig()
    
    // MARK: -
    // MARK: - Class Functions
    
    internal func setupMenuCell(config: SSMenuCellConfig) {
        self.selectionStyle = .none
        self.config = config
        backgroundColor = config.bgColor
        
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: config.leftIconPadding).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: config.imageHeight).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: config.imageWidth).isActive = true
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: config.imageToTitlePadding).isActive = true
    }
    
    internal func setData(image: UIImage?, title: String?) {
        iconImageView.image = image
        label.text = title
    }
    
    internal func setSelected(isSelected: Bool) {
        self.label.textColor = isSelected ? config.selectedColor : config.nonSelectedColor
        let selectedImage = self.iconImageView.image?.withRenderingMode(.alwaysTemplate)
        self.iconImageView.tintColor = isSelected ? config.selectedColor : config.nonSelectedColor
        self.iconImageView.image = selectedImage
    }
    
}// End of Class
