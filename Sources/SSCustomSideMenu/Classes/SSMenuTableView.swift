//
//  SSMenuTableView.swift
//  SSSideMenu
//
//  Created by Kunjal Soni on 16/01/20.
//  Copyright © 2020 Kunjal Soni. All rights reserved.
//

import UIKit 

open class SSMenuTableView: UITableView {
    
    // MARK: -
    // MARK: - Variables
    
    var selectedIndexPath: IndexPath? = IndexPath(row: 0, section: 0)
    public weak var ssMenuTableDataSource: SSMenuTableDataSource?
    public var config = SSMenuCellConfig() {
        didSet {
            self.reloadData()
        }
    }
    
    // MARK: -
    // MARK: - View Life Cycle
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = .clear
        dataSource = self
        self.reloadData()
    }
    
}

// MARK: -
// MARK: - Table View Data Source

extension SSMenuTableView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return config.numberOfOptions
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if config.cellStyle == .defaultStyle {
            let cell = SSMenuCell()
            cell.setupMenuCell(config: config)
            let image = (config.images.count <= indexPath.row) ? nil : config.images[indexPath.row]
            let title = (config.titles.count <= indexPath.row) ? "" : config.titles[indexPath.row]
            cell.setData(image: image, title: title)
            cell.setSelected(isSelected: self.selectedIndexPath == indexPath)
            return cell
        } else {
            return (ssMenuTableDataSource?.ssMenuTableView(tableView, cellForRowAt: indexPath))!
        }
    }
    
}
