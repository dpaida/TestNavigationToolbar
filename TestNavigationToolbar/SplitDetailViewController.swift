//
//  SplitDetailViewController.swift
//  TestNavigationToolbar
//
//  Created by Paida,Douglas on 7/16/18.
//  Copyright © 2018 Paida,Douglas. All rights reserved.
//

import UIKit

class SplitDetailViewController: UIViewController {

    var item: Item?
    {
        didSet {
            self.itemDescriptionLabel.text = item?.description
        }
    }
    
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.edgesForExtendedLayout = []
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
