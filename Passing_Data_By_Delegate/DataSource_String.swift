//
//  DataSource_String.swift
//  Passing_Data_By_Delegate
//
//  Created by Admin on 1/7/18.
//  Copyright © 2018 DuongPham. All rights reserved.
//

import Foundation
import UIKit

class DataSource_String: NSObject, UITableViewDataSource {
    
    // MARK : Properties
    var arr_String = ["Duong","Dep","Trai"]
//    var create_A = ViewController().createAlert(title: "WARNINg", message: "NO_DATA")
    let alertController = UIAlertController(title: "Alert", message: "This is an alert.", preferredStyle: .alert)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_String.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr_String[indexPath.row]
        return cell
    }
    
    // MARK: Coding the function Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arr_String.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if arr_String.count == 0 {
//                self.present(alertController, animated: true, completion: nil)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
}
