//
//  SplitDetailContainerViewController.swift
//  TestNavigationToolbar
//
//  Created by Paida,Douglas on 7/16/18.
//  Copyright © 2018 Paida,Douglas. All rights reserved.
//

import UIKit

class SplitDetailContainerViewController: UIViewController, ItemSelectionDelegate, HideableHairlineViewController {

    var detailController: SplitDetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("*** DETAIL title = \(self.navigationController?.navigationBar.topItem?.title)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideHairline()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        showHairline()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemSelected(_ newItem: Item) {
        self.detailController?.item = newItem
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        guard let segueID = segue.identifier else { return }
        switch segueID
        {
        case "EmbedDetail":
            let destController = segue.destination as! SplitDetailViewController
            self.detailController = destController
        default:
            break
        }
    }

}
