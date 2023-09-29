//
//  Config.swift
//  SSSideMenu
//
//  Created by Kunjal Soni on 10/01/20.
//  Copyright © 2020 Kunjal Soni. All rights reserved.
//

import UIKit

open class SSSideMenuConfig {
    
    // Cell type: DefaultStyle will use default cell design
    // For custom design, use customStyle
    
    // Home View controller will be shown by default
    public var homeController: UIViewController!
    public var menuTable: SSMenuTableView!
    
    // Gestures
    public var isTapGestureEnabled = true
    
    // Menu Width
    public var menuWidth: CGFloat = UIScreen.main.bounds.width - 80
    
    // Animations
    public var animationDuration = 0.5
    public var damping: CGFloat = 1
    public var animationType: SSMenuAnimationType = .slideIn
    
    // Action target ViewControllers
    public var viewControllers = [UIViewController]()
    public var sideMenuPlacement = SSSideMenuPlacement.left
    
    // MARK: -
    // MARK: - Init
    
    public init() { }
    
}

open class SSMenuCellConfig {
    // Number of options in menu
    public var numberOfOptions: Int = 0
    
    public var cellStyle = SSMenuCellType.defaultStyle
    
    // Data Sources
    public var images = [UIImage?]()
    public var titles = [String?]()
    
    // Height of menu image
    public var imageHeight: CGFloat = 24
    
    // Width of menu image
    public var imageWidth: CGFloat = 24
    
    // Padding from left anchor to icon
    public var leftIconPadding: CGFloat = 12
    
    // Padding from image to title
    public var imageToTitlePadding: CGFloat = 12
    
    // Background color of cell
    public var bgColor = UIColor.clear
    
    // selected font and image tint color
    public var selectedColor = UIColor.blue
    public var nonSelectedColor = UIColor.black
    
    // MARK: -
    // MARK: - Init
    
    public init() { }
    
}
