//
//  MasterNavigationController.swift
//  TestNavigationToolbar
//
//  Created by Paida,Douglas on 7/17/18.
//  Copyright © 2018 Paida,Douglas. All rights reserved.
//

import UIKit

class MasterNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    override func collapseSecondaryViewController(_ secondaryViewController: UIViewController, for splitViewController: UISplitViewController) {
        print("*** MASTER NC: collapseSecondaryViewController, secondary VC = \(secondaryViewController)")
        
        guard let navController = secondaryViewController as? UINavigationController, let detailController = navController.topViewController, detailController is SplitViewDetailDelegate else {
            super.collapseSecondaryViewController(secondaryViewController, for: splitViewController)
            return
        }
        self.pushViewController(detailController, animated: false)
        (detailController as? HideableHairlineViewController)?.hideHairline()
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
