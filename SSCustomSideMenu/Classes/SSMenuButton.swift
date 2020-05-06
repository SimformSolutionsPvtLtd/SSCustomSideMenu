//
//  SSMenuButton.swift
//  Pods-SSSideMenu_Example
//
//  Created by Kunjal Soni on 22/04/20.
//

import UIKit

open class SSMenuButton: UIButton {
    
    // MARK: -
    // MARK: - Variables
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    // MARK: -
    // MARK: - Life Cycle
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        self.addTarget(self, action: #selector(sideMenuButtonTapped), for: .touchUpInside)
    }
    
    // MARK: -
    // MARK: - Class Functions
    
    @objc private func sideMenuButtonTapped() {
        SSSideMenuControls.openOrCloseSideMenu()
    }

}
