//
//  HierarchyViewController.swift
//  XXLEditor
//
//  Created by Gil on 12/27/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

protocol HierarchyViewControllerDelegate: class {
    func didSelect(descriptor: Descriptor?)
}

class HierarchyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var rootDescriptor: Descriptor? {
        didSet {
            if let rootDescriptor = rootDescriptor {
                hierarchy = DescriptorHierarchy(descriptor: rootDescriptor)
            }
        }
    }
    var hierarchy: DescriptorHierarchy?
    
    weak var delegate: HierarchyViewControllerDelegate?
    @IBOutlet var tableView: UITableView!
    
    @IBAction func createView(_ sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let initialProperties: DescriptorInstanceProperties = ["size": CGSize(width: 32, height: 32),
                                                                   "backgroundColor": UIColor.red]
            hierarchy?.addDescriptor(ViewDescriptor(properties: initialProperties),
                                     asChildOf: descriptor(forIndexPath: indexPath)!)
            tableView.reloadData()
        }
    }
    
    func descriptor(forIndexPath indexPath: IndexPath) -> Descriptor? {
        return hierarchy?[indexPath.row]
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hierarchy?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "view", for: indexPath)

        if let cell = cell as? HierarchyViewCell {
            cell.descriptor = descriptor(forIndexPath: indexPath) as? ViewDescriptor
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(descriptor: descriptor(forIndexPath: indexPath))
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
