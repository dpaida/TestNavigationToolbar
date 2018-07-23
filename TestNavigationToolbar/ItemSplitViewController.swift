//
//  ItemSplitViewController.swift
//  TestNavigationToolbar
//
//  Created by Doug Paida on 7/18/18.
//  Copyright © 2018 Paida,Douglas. All rights reserved.
//

import UIKit

protocol SplitViewDetailDelegate: class {
    var noItemSelected: Bool { get }
}

extension UINavigationController {
    override open func collapseSecondaryViewController(_ secondaryViewController: UIViewController, for splitViewController: UISplitViewController) {
        print("*** MASTER NC: collapseSecondaryViewController, secondary VC = \(secondaryViewController)")
        
        guard let navController = secondaryViewController as? UINavigationController, let detailController = navController.topViewController, detailController is SplitViewDetailDelegate else {
            super.collapseSecondaryViewController(secondaryViewController, for: splitViewController)
            return
        }
        self.pushViewController(detailController, animated: false)
        (detailController as? HideableHairlineViewController)?.hideHairline()
    }
}

class ItemSplitViewController: UISplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        guard let navController1 = self.childViewControllers.first as? UINavigationController else { return }
        guard let masterController = navController1.topViewController as? SplitMasterViewController else { return }
        
        guard let navController2 = self.childViewControllers.last as? UINavigationController else { return }
        guard let detailController = navController2.topViewController as? SplitDetailContainerViewController else { return }
        */
        
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

/*
extension ItemSplitViewController: UISplitViewControllerDelegate
{
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        
        guard let masterNavController = splitViewController.childViewControllers.first as? MasterNavigationController else { return nil }
        
        if let detailController = masterNavController.topViewController as? SplitDetailContainerViewController
        {
            guard let detailNavController = splitViewController.storyboard?.instantiateViewController(withIdentifier: "DetailNavigationController") as? DetailNavigationController else { return nil }
            masterNavController.popViewController(animated: false)
            detailNavController.viewControllers = [detailController]
            return detailNavController
        }
            
        else if let masterController = masterNavController.topViewController as? SplitMasterViewController
        {
            guard let detailNavController = splitViewController.storyboard?.instantiateViewController(withIdentifier: "DetailNavigationController") as? DetailNavigationController else { return nil }
            guard let detailController = detailNavController.topViewController as? SplitDetailContainerViewController else { return nil }
            masterController.delegate = detailController
            return detailNavController
        }
        return nil
    }
    
    func primaryViewController(forExpanding splitViewController: UISplitViewController) -> UIViewController? {
        guard let masterNavController = splitViewController.childViewControllers.first as? MasterNavigationController else { return nil }
        return masterNavController
    }
}
*/

extension ItemSplitViewController: UISplitViewControllerDelegate
{
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? SplitViewDetailDelegate else { return false }
        return topAsDetailController.noItemSelected
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        print("*** SV DELEGATE: separateSecondaryFromPrimary")
        guard let masterNavController = splitViewController.childViewControllers.first as? UINavigationController else { return nil }
        guard let detailNavController = splitViewController.storyboard?.instantiateViewController(withIdentifier: "DetailNavigationController") as? UINavigationController else { return nil }

        if let detailController = masterNavController.topViewController, detailController is SplitViewDetailDelegate
        {
            masterNavController.popViewController(animated: false)
            detailNavController.viewControllers = [detailController]
        }
        
        return detailNavController
    }    
}
