//
//  SplitMasterViewController.swift
//  TestNavigationToolbar
//
//  Created by Paida,Douglas on 7/16/18.
//  Copyright © 2018 Paida,Douglas. All rights reserved.
//

import UIKit

protocol ItemSelectionDelegate: class {
    func itemSelected(_ newItem: Item)
}

class SplitMasterViewController: UITableViewController {

    weak var delegate: ItemSelectionDelegate?
    var items: [Item] = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.items = [
            Item(description: "First Item"),
            Item(description: "Second Item"),
            Item(description: "Third Item"),
            Item(description: "Fourth Item")
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let item = self.items[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = item.description
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = self.items[indexPath.row]
        print("*** SPLIT MASTER, didSelect \(selectedItem)")
        delegate?.itemSelected(selectedItem)
        if let detailController = delegate as? SplitDetailContainerViewController
        {
            //self.splitViewController?.showDetailViewController(detailController.navigationController!, sender: nil)
            print("*** SPLIT MASTER, didSelect - showDetail")
            if self.splitViewController?.isCollapsed ?? false
            {
                self.splitViewController?.showDetailViewController(detailController, sender: nil)
            }
            else
            {
                self.splitViewController?.showDetailViewController(detailController.navigationController!, sender: nil)
            }
        }
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = self.items[indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: selectedItem)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        guard let segueID = segue.identifier else { return }
        switch segueID
        {
        case "showDetail":
            let selectedItem = sender as! Item
            let navController = segue.destination as! DetailNavigationController
            let destController = navController.topViewController as! SplitDetailContainerViewController
            destController.itemSelected(selectedItem)
            
        default:
            break
        }
    }

}
