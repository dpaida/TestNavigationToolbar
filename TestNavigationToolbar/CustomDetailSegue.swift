//
//  CustomDetailSegue.swift
//  TestNavigationToolbar
//
//  Created by Doug Paida on 7/22/18.
//  Copyright © 2018 Paida,Douglas. All rights reserved.
//

import UIKit

class CustomDetailSegue: UIStoryboardSegue {
    override func perform() {
        if let splitController = source.splitViewController
        {
            if splitController.isCollapsed
            {
                if let navController = destination as? UINavigationController, let destController = navController.topViewController
                {
                    splitController.showDetailViewController(destController, sender: nil)
                }
                else
                {
                    splitController.showDetailViewController(destination, sender: nil)
                }
            }
            else
            {
                splitController.showDetailViewController(destination, sender: nil)
            }
        }
        else
        {
            source.showDetailViewController(destination, sender: nil)
        }
    }
}
