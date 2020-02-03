//
//  SideMenuTableViewController.swift
//  matchbox
//
//  Created by Shayan Rastegar on 23/07/2017.
//  Copyright © 2017 Shayan Rastegar. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a background view to the table view.
        let backgroundImage = UIImage(named: "sideMenu")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Center and scale background image.
        imageView.contentMode = .scaleAspectFill
        
        // Set the background color to match better.
        tableView.backgroundColor = UIColor(red: 0.89, green: 0.73, blue: 0.29, alpha: 1.0)

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var identifier: String?
        if indexPath.row == 0 {
            identifier = "profileCell"
        }
        else if indexPath.row == 1 {
            identifier = "sparkCell"
        }
        else if indexPath.row == 2 {
            identifier = "matchboxCell"
        }
        else if indexPath.row == 3 {
            identifier = "settingsCell"
        }
        else if indexPath.row == 4 {
            identifier = "spacerCell"
        }
        
        
        
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier!)

        // Configure the cell...

        return cell!
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        
        // Setting login viewController as rootViewController, eliminating back button on nav bar.
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "navigationController1") as! NavigationController1
        UIApplication.shared.keyWindow?.rootViewController = viewController
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
