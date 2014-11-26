//
//  TDListTableViewController.swift
//  ToDo
//
//  Created by user on 26/11/2014.
//  Copyright (c) 2014 user. All rights reserved.
//

import UIKit

class TDListTableViewController: UITableViewController {
    
    var toDoItemsArray: [ToDoItem] = [];
    
    override func awakeFromNib() {
        toDoItemsArray.append(ToDoItem(name: "milk"));
           toDoItemsArray.append(ToDoItem(name: "milf"));
           toDoItemsArray.append(ToDoItem(name: "milk"));
           toDoItemsArray.append(ToDoItem(name: "milf"));
        super.awakeFromNib();
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return toDoItemsArray.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath) as UITableViewCell
//        toDoItemsArray[indexPath.row].itemName;
        cell.textLabel.text = toDoItemsArray[indexPath.row].itemName;
        // Configure the cell...
        if (toDoItemsArray[indexPath.row].completed) {
            cell.accessoryType = .Checkmark;
        }
        else {
            cell.accessoryType = .None;
        }
        return cell
    }
   
/*    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text =toDoItemsArray[indexPath.row]
        tappedItem.completed
    }*/
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        let tappedItem = toDoItemsArray[indexPath.row]
        tappedItem.completed = !tappedItem.completed
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwindToList(segue: UIStoryboardSegue)
    {
    let source = segue.sourceViewController as TDLItemViewController
        
        if let item = source.toDoItem {
        toDoItemsArray.append(item)
            tableView.reloadData();
        }
    }
}
