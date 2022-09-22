//
//  Enums.swift
//  SSSideMenu
//
//  Created by Kunjal Soni on 17/01/20.
//  Copyright © 2020 Kunjal Soni. All rights reserved.
//

import UIKit

public enum SSMenuAnimationType {
    case slideIn, slideOut, compress(CGFloat, CGFloat)
}

public enum SSMenuCellType {
    case defaultStyle, customStyle
}

public enum SSSideMenuPlacement {
    case left, right
}
