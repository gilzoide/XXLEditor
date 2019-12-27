//
//  EditorTableViewController.swift
//  XXLEditor
//
//  Created by Gil on 12/23/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class InspectorViewController: UITableViewController, PropertyEditorCellDelegate {
    var descriptor: Descriptor? {
        didSet {
            loadViewIfNeeded()
            declaredPropertyList = descriptor?.declaredPropertyList ?? []
            tableView.reloadData()
        }
    }
    private var declaredPropertyList: DescriptorPropertyList = []
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func propertyFor(indexPath: IndexPath) -> Property {
        return declaredPropertyList[indexPath.item]
    }
    
    func propertyEditorChangedValue(_ editor: PropertyEditorCell) {
        if let keyPath = editor.property?.keyPath {
            let _ = descriptor?.setProperty(keyPath, value: editor.value)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return descriptor != nil ? 1 : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return declaredPropertyList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let property = propertyFor(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: property.type.editorIdentifier, for: indexPath)

        if let cell = cell as? PropertyEditorCell {
            cell.property = property
            cell.setValue(descriptor?.property(property.keyPath) ?? 0)
            cell.delegate = self
        }

        return cell
    }
    
    var heightCache: [String: CGFloat] = [:]
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let identifier = propertyFor(indexPath: indexPath).type.editorIdentifier
        if let height = heightCache[identifier] {
            return height
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        let height = cell?.bounds.height ?? tableView.rowHeight
        heightCache[identifier] = height
        return height
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
