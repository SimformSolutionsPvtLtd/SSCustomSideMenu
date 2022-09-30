//
//  ContainerVC.swift
//  SSSideMenu
//
//  Created by Kunjal Soni on 08/01/20.
//  Copyright © 2020 Kunjal Soni. All rights reserved.
//

import UIKit

open class SSSideMenuControls {
    fileprivate static var action = Dynamic(Void())
    public static func openOrCloseSideMenu() {
        SSSideMenuControls.action.fire()
    }
}

open class SSSideMenuContainerViewController: UIViewController {
    
    // MARK: -
    // MARK: - Variables
    
    private var isExpanded = false
    private let imageView = UIImageView()
    private var previousIndexPath: IndexPath? = IndexPath(row: 0, section: 0)
    private let contentContainerView = UIView()
    open var ssMenuConfig = SSSideMenuConfig() {
        didSet {
            configureHomeController()
            tapGesture?.isEnabled = false
        }
    }
    weak open var menuSelectionActionDelegate: SSMenuTableDelegate?
    open weak var sideMenuDelegate: SSSideMenuDelegate?
    private let menuContainerView = UIView()
    private var selectedIndex: Int? = 0
    private var tapGesture: UITapGestureRecognizer? = UITapGestureRecognizer()
    
    // MARK: -
    // MARK: - Life Cycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        SSSideMenuControls.action.bind { [weak self] (_) in
            guard let uSelf = self else { return }
            uSelf.configureMenuFor(menuOption: nil, openViewController:  false)
        }
    }
    
    // MARK: -
    // MARK: - Class Functions
    
    private func configureHomeController() {
        if ssMenuConfig.homeController == nil {
            ssMenuConfig.homeController = ssMenuConfig.viewControllers[0]
        }
        
        contentContainerView.frame = self.view.bounds
        contentContainerView.layer.shadowColor = UIColor.black.cgColor
        contentContainerView.layer.shadowOpacity = 0.5
        contentContainerView.layer.shadowRadius = 25
        imageView.frame = contentContainerView.frame
        imageView.clipsToBounds = true
        self.view.addSubview(contentContainerView)
        
        load(ssMenuConfig.homeController, on: contentContainerView)
        contentContainerView.sendSubviewToBack(ssMenuConfig.homeController.view)
        
        setNeedsStatusBarAppearanceUpdate()
        
        // Add tap gesture
        if ssMenuConfig.isTapGestureEnabled {
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(performGestureAction))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGesture!)
        }
    }
    
    internal func changeSideMenuState() {
        self.configureMenuFor(menuOption: nil, openViewController: false)
    }
    
    private func configureMenuController() {
        ssMenuConfig.menuTable.delegate = self
        self.menuContainerView.frame = CGRect(x: (ssMenuConfig.sideMenuPlacement == . left) ? -ssMenuConfig.menuWidth : UIScreen.main.bounds.width, y: 0, width: ssMenuConfig.menuWidth, height: self.view.frame.height)
        ssMenuConfig.menuTable.frame = CGRect(x: 0, y: 0, width: ssMenuConfig.menuWidth, height: self.view.frame.height)
        self.menuContainerView.addSubview(ssMenuConfig.menuTable)
        self.view.addSubview(menuContainerView)
    }
    
    @objc private func performGestureAction() {
        if isExpanded {
            self.configureMenuFor(menuOption: nil, openViewController: false)
        }
    }
    
    private func didSelectMenuOption(menuOption: Int?) {
        for subview in contentContainerView.subviews {
            subview.removeFromSuperview()
        }
        self.ssMenuConfig.homeController = ssMenuConfig.viewControllers[menuOption!]
        configureHomeController()
    }
    
    private func performOpenAnimation() {
        if ssMenuConfig.sideMenuPlacement == .left {
            self.menuContainerView.frame.origin.x = 0
            switch ssMenuConfig.animationType {
            case .slideIn:
                break
            case .slideOut:
                self.contentContainerView.frame.origin.x = self.ssMenuConfig.menuWidth
            case .compress(let multiplier, let cornerRadius):
                self.imageView.layer.cornerRadius = cornerRadius
                self.contentContainerView.transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
                self.contentContainerView.frame = CGRect(x: self.ssMenuConfig.menuWidth, y: 0, width: contentContainerView.frame.width, height: contentContainerView.frame.height)
                self.contentContainerView.center.y = UIScreen.main.bounds.height / 2
            }
        } else {
            self.menuContainerView.frame.origin.x = UIScreen.main.bounds.width - ssMenuConfig.menuWidth
            switch ssMenuConfig.animationType {
            case .slideIn:
                break
            case .slideOut:
                self.contentContainerView.frame.origin.x = -ssMenuConfig.menuWidth
            case .compress(let multiplier, let cornerRadius):
                self.imageView.layer.cornerRadius = cornerRadius
                let screenWidth = UIScreen.main.bounds.width
                self.contentContainerView.transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
                self.contentContainerView.frame = CGRect(x: (screenWidth - ssMenuConfig.menuWidth) - (multiplier * screenWidth), y: 0, width: contentContainerView.frame.width, height: contentContainerView.frame.height)
                self.contentContainerView.center.y = UIScreen.main.bounds.height / 2
            }
        }
    }
    
    private func performCloseAnimation() {
        self.menuContainerView.frame.origin.x = (ssMenuConfig.sideMenuPlacement == .left) ?  -self.ssMenuConfig.menuWidth : UIScreen.main.bounds.width
        
        switch ssMenuConfig.animationType {
        case .slideIn:
            break
        case .slideOut:
            self.contentContainerView.frame.origin.x = 0
        case .compress(_):
            contentContainerView.transform = .identity
            contentContainerView.frame = self.view.bounds
            self.imageView.layer.cornerRadius = 0
        }
    }
    
    private func takeScreenshot(_ shouldSave: Bool = false) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        return image
    }
    
    private func animatePanel(shouldExpand: Bool, menuOption: Int?, openViewController: Bool) {
        if shouldExpand {
            // Show menu
            tapGesture?.isEnabled = true
            
            switch ssMenuConfig.animationType {
            case .compress(_):
                imageView.image = takeScreenshot()
                unload(ssMenuConfig.homeController)
            default:
                imageView.image = nil
            }
            contentContainerView.addSubview(imageView)
            
            UIView.animate(withDuration: ssMenuConfig.animationDuration, delay: 0, usingSpringWithDamping: ssMenuConfig.damping, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.performOpenAnimation()
            }, completion: nil)
        } else {
            // Hide menu
            tapGesture?.isEnabled = false
            UIView.animate(withDuration: ssMenuConfig.animationDuration, delay: 0, usingSpringWithDamping: ssMenuConfig.damping, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.performCloseAnimation()
            }) { (_) in
                switch self.ssMenuConfig.animationType {
                case .compress(_):
                    self.load(self.ssMenuConfig.homeController, on: self.contentContainerView)
                default:
                    break
                }
                self.imageView.removeFromSuperview()
                guard let menuOption = menuOption else { return }
                if openViewController {
                    self.didSelectMenuOption(menuOption: menuOption)
                }
            }
        }
    }
    
    private func configureMenuFor(menuOption: Int?, openViewController: Bool = true) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption, openViewController: openViewController)
    }
}

extension SSSideMenuContainerViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shouldOpenViewController = sideMenuDelegate?.shouldOpenViewController(forMenuOption: indexPath.row) ?? false
        if shouldOpenViewController {
            ssMenuConfig.menuTable.selectedIndexPath = indexPath
        }
        menuSelectionActionDelegate?.sideMenuDidSelectOption(tableView, indexPath: indexPath, previousIndexPath: previousIndexPath)
        self.configureMenuFor(menuOption: indexPath.row, openViewController: shouldOpenViewController)
        previousIndexPath = indexPath
        ssMenuConfig.menuTable.reloadData()
    }
    
}
