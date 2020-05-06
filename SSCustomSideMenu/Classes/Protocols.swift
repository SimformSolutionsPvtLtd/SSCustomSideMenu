//
//  Protocols.swift
//  SSSideMenu
//
//  Created by Kunjal Soni on 09/01/20.
//  Copyright © 2020 Kunjal Soni. All rights reserved.
//

import UIKit

public protocol SSSideMenuDelegate: class {
    func shouldOpenViewController(forMenuOption menuOption: Int) -> Bool
}

public protocol SSMenuTableDataSource: class {
    func ssMenuTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

public protocol SSMenuTableDelegate: class {
    func sideMenuDidSelectOption(_ tableView: UITableView, indexPath: IndexPath, previousIndexPath: IndexPath?)
}
