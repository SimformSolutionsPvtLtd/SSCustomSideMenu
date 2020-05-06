# SSCustomSideMenu

[![Version](https://img.shields.io/cocoapods/v/SSCustomSideMenu.svg?style=flat)](https://cocoapods.org/pods/SSCustomSideMenu)
[![License](https://img.shields.io/cocoapods/l/SSCustomSideMenu.svg?style=flat)](https://cocoapods.org/pods/SSCustomSideMenu)
[![Platform](https://img.shields.io/cocoapods/p/SSCustomSideMenu.svg?style=flat)](https://cocoapods.org/pods/SSCustomSideMenu)

## Features
  - Highly customizable
  - Multiple options of animations
  - Dynamic menu size
  - Available through CocoaPods

## Requirements
  - iOS 11.0+
  - Xcode 10+

## Installation
 **CocoaPods**
 
- You can use CocoaPods to install SSCustomSideMenu by adding it to your Podfile:

        use_frameworks!
        pod 'SSCustomSideMenu'

- In the swift file, import SSSideMenu module:
            
        import UIKit
        import SSCustomSideMenu

**Manually**
-   Download and drop **SSCustomSideMenu** folder in your project.
-   Congratulations!

## Usage example

 **Create a subclass of SSSideMenuContainerViewController**

    class SideMenuViewController: SSSideMenuContainerViewController { ... }


-   In the storyboard assign a custom class **SideMenuViewController** you just created to a viewController. This viewController will be the container for Side menu.
   ![Alt text](http://files.simformsolutions.com.s3.amazonaws.com/simformscreen/Main.storyboard_2020-04-23_10-22-17.png)
   
    **Create Menu Table**

        let menuTable = SSMenuTableView()
   
    
    **Configure Side Menu Options**
    
        let menuCellConfig = SSMenuCellConfig()
        
        menuCellConfig.cellStyle = .defaultStyle
        
        menuCellConfig.leftIconPadding = 20
        menuCellConfig.imageToTitlePadding = 10
        menuCellConfig.imageHeight = 24
        menuCellConfig.imageWidth = 24
        
        menuCellConfig.numberOfOptions = 3
        
        menuCellConfig.selectedColor = .purple
        menuCellConfig.nonSelectedColor = .black
        
        menuCellConfig.images = [UIImage(named: "first"), UIImage(named: "second"), UIImage(named: "third")]
        menuCellConfig.titles = ["First", "Second", "Thrird"]
        
        self.menuTable.config = menuCellConfig
        
    
    **Configure Side Menu**
    
        let sideMenuConfig = SSSideMenuConfig()
        sideMenuConfig.animationType = .slideOut // Other options:  .slideIn, .compress(0.8, 20)
        sideMenuConfig.sideMenuPlacement = .left // Other options:  .right
        sideMenuConfig.menuWidth = UIScreen.main.bounds.width * 0.5
        
        let firstViewController = storyboard?.instantiateViewController(withIdentifier: "FirstViewController")
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        let thirdViewController = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController")
        
        sideMenuConfig.viewControllers = [firstViewController!, secondViewController!, thirdViewController!]
        
        sideMenuConfig.menuTable = menuTable
        
        self.ssMenuConfig = sideMenuConfig
        
        
    **Delegates**
    
    - SSCustomSideMenu provides delegate 'sideMenuDelegate' which lets developers dynamically decide which operations to perform on menu option selection
        
            sideMenuDelegate = self
    
    - By doing this, you will be asked to confirm to following protocol:
    
            extension ViewController: SSSideMenuDelegate {
                func shouldOpenViewController(forMenuOption menuOption: Int) -> Bool {
                    if menuOption == 1 {
                        // Perform action for custom options (i.e logout)
                        return false
                    } else {
                        return true
                    }
                }
            }


    **Open and Close Side Menu**
    
    - SSCustomSideMenu Provides custom side menu button - 'SSMenuButton'. 
       You only need to assign SSMenuButton custom class to your UIButton from Interface Builder
    
    - Manually open or close side menu :
    
            SSSideMenuControls.openOrCloseSideMenu()

## Author

-  kunjalsoni-simformsolutions, kunjal.s@simformsolutions.com
    
#  Contribute
-   We would love you for the contribution to SSCustomSideMenu, check the LICENSE file for more info.

# License

-  SSCustomSideMenu is available under the MIT license. See the LICENSE file for more info.
 
[![License](https://img.shields.io/cocoapods/l/SSCustomSideMenu.svg?style=flat)](https://cocoapods.org/pods/SSCustomSideMenu)
[![Platform](https://img.shields.io/cocoapods/p/SSCustomSideMenu.svg?style=flat)](https://cocoapods.org/pods/SSCustomSideMenu)
