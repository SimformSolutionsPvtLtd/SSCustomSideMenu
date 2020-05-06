//
//  ViewController.swift
//  SSCustomSideMenu
//
//  Created by Kunjal Soni on 02/04/20.
//  Copyright © 2020 Kunjal Soni. All rights reserved.
//

import UIKit
import SSCustomSideMenu

class ViewController: SSSideMenuContainerViewController {
    
    let menuTable = SSMenuTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSideMenu()
    }
    
    private func configureSideMenu() {
        
        self.menuTable.backgroundColor = .clear
        menuTable.separatorStyle = .none
        menuTable.rowHeight = 60
        menuTable.showsHorizontalScrollIndicator = false
        menuTable.showsVerticalScrollIndicator = false
        
        let menuCellConfig = SSMenuCellConfig()
        
        menuCellConfig.cellStyle = .defaultStyle // .customStyle
        menuCellConfig.leftIconPadding = 20
        menuCellConfig.imageToTitlePadding = 10
        menuCellConfig.imageHeight = 24
        menuCellConfig.imageWidth = 24
        
        menuCellConfig.selectedColor = UIColor(named: "buttonColor")!
        menuCellConfig.nonSelectedColor = .black
        
        menuCellConfig.images = [UIImage(named: "first"), UIImage(named: "second"), UIImage(named: "third"), UIImage(named: "logout")]
        menuCellConfig.titles = ["Home", "My Friends", "Settings", "Logout"]
        
        menuCellConfig.numberOfOptions = 4
        menuTable.config = menuCellConfig
        
        let sideMenuConfig = SSSideMenuConfig()
        sideMenuConfig.animationType = .slideOut // .slideIn, .compress(0.8, 20)
        sideMenuConfig.sideMenuPlacement = .left // .right
        sideMenuConfig.menuWidth = UIScreen.main.bounds.width * 0.5
        
        let firstViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "MyFriendsViewController")
        let thirdViewController = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")
        
        sideMenuConfig.viewControllers = [firstViewController!, secondViewController!, thirdViewController!]
        sideMenuConfig.menuTable = menuTable
        self.ssMenuConfig = sideMenuConfig
        
        self.sideMenuDelegate = self
    }
    
}

// MARK: -
// MARK: - SSSideMenu Delegate

extension ViewController: SSSideMenuDelegate {

    func shouldOpenViewController(forMenuOption menuOption: Int) -> Bool {
        // Perform action for custom options (i.e logout)
        if menuOption == 3 {
            return false
        } else {
            return true
        }
    }
    
}
