//
//  RootViewController.swift
//  TestNavigationToolbar
//
//  Created by Paida,Douglas on 7/11/18.
//  Copyright © 2018 Paida,Douglas. All rights reserved.
//

import UIKit

protocol HideableHairlineViewController {
    
    func hideHairline()
    func showHairline()
    
}

extension HideableHairlineViewController where Self: UIViewController {
    
    func hideHairline() {
        if let navBar = findHairline()?.superview?.superview as? UINavigationBar {
            //print("*** HAIRLINE hide, navBar title = \(navBar.topItem?.title)")
        }
        //print("*** HAIRLINE hide = \(findHairline()?.superview?.superview)")
        findHairline()?.isHidden = true
    }
    
    func showHairline() {
        //print("*** HAIRLINE show = \(findHairline())")
        findHairline()?.isHidden = false
    }
    
    private func findHairline() -> UIImageView? {
        return navigationController?.navigationBar.subviews
            .flatMap { $0.subviews }
            .flatMap { $0 as? UIImageView }
            //.filter { $0.bounds.size.width == self.navigationController?.navigationBar.bounds.size.width }
            .filter { $0.bounds.size.height <= 2 }
            .first
    }
    
}

class RootViewController: UIViewController, HideableHairlineViewController {

    @IBOutlet weak var stackView: UIStackView!
    var topView: UIView?
    var bottomView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.topView = self.stackView.arrangedSubviews.first
        self.bottomView = self.stackView.arrangedSubviews.last
    }

    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideHairline()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        showHairline()
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            if size.width > size.height
            {
                self.topView?.isHidden = true
            }
            else
            {
                self.topView?.isHidden = false
            }
        },
        completion: nil)
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
