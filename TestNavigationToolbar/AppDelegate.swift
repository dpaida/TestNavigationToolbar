//
//  AppDelegate.swift
//  TestNavigationToolbar
//
//  Created by Paida,Douglas on 7/11/18.
//  Copyright © 2018 Paida,Douglas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        guard let tabController = window?.rootViewController as? UITabBarController else { return true }
        guard let splitController = tabController.childViewControllers[2] as? UISplitViewController else { return true }
        guard let navController1 = splitController.childViewControllers.first as? UINavigationController else { return true }
        guard let masterController = navController1.topViewController as? SplitMasterViewController else { return true }
        guard let navController2 = splitController.childViewControllers.last as? UINavigationController else { return true }
        guard let detailController = navController2.topViewController as? SplitDetailContainerViewController else { return true }
        splitController.delegate = self
        masterController.delegate = detailController
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        print("*** COLLAPSE \(secondaryViewController) ONTO \(primaryViewController) = true")
        /*
        guard let secondaryVC = secondaryViewController as? UINavigationController else { return false }
        secondaryVC.pushViewController(primaryViewController, animated: true)
        */
        return true
    }

    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        print("*** SEPARATE FROM \(primaryViewController)")
        if let child1 = splitViewController.childViewControllers.first { print("*** FIRST CHILD \(child1)") }
        if let child2 = splitViewController.childViewControllers.last { print("*** SECOND CHILD \(child2)") }
        let newSecondary = splitViewController.storyboard?.instantiateViewController(withIdentifier: "DetailNavigationController") as! DetailNavigationController
        return newSecondary
    }
    
    func primaryViewController(forExpanding splitViewController: UISplitViewController) -> UIViewController? {
        print("*** SPLIT VIEW PRIMARY VC FOR EXPAND")
        return nil
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, showDetail vc: UIViewController, sender: Any?) -> Bool {
        print("*** SPLIT VIEW SHOW DETAIL")
        return false
    }
    
    /*
    func primaryViewController(forCollapsing splitViewController: UISplitViewController) -> UIViewController? {
        let defaultController = splitViewController.childViewControllers.last
        print("*** DEFAULT VC FOR COLLAPSE = \(defaultController)")
        guard let detailNavController = splitViewController.childViewControllers.last as? UINavigationController else { return defaultController }
        guard let detailContainer = detailNavController.topViewController as? SplitDetailContainerViewController else { return defaultController }
        print("*** PRIMARY VC FOR COLLAPSE = \(detailContainer)")
        return detailContainer
    }
    */
}

