//
//  ViewController.swift
//  Passing_Data_By_Delegate
//
//  Created by Admin on 1/7/18.
//  Copyright © 2018 DuongPham. All rights reserved.
//

import UIKit
import os.log

//protocol CheckData: class {
//    func setHaveNoDataLabel(haveNoData: Bool)
//}

class ViewController: UIViewController, Delegate_DataSource {

    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    var dbSource_Int = DataSource_Int()
    var dbSource_String = DataSource_String()
    var delegate_String = Delegate_String()
    var delegate_Int = Delegate_Int()
    @IBOutlet var view_Warning: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = dbSource_Int
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: Create box Alert
    func createAlert (title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //CREATING ON BUTTON
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print ("YES")
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("NO")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func passData(_ name: String) {
        if let indexPath = tableView.indexPathForSelectedRow {
            if tableView.dataSource === dbSource_Int {
                dbSource_Int.arr_Int[indexPath.row] = Int(name)!
            } else {
                dbSource_String.arr_String[indexPath.row] = name
            }
        } else {
            if tableView.dataSource === dbSource_Int {
                dbSource_Int.arr_Int.append(Int(name)!)
            } else {
                dbSource_String.arr_String.append(name)
            }
        }
        tableView.reloadData()
    }

    // MARK: Coding the function UI_Switch
    @IBAction func Switch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            tableView.dataSource = dbSource_Int
        } else {
            tableView.dataSource = dbSource_String
        }
        tableView.reloadData()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let selected = tableView.indexPathForSelectedRow
        guard let vc_CallBack = segue.destination as? VC_CallBack else {
            return
        }
        switch (segue.identifier ?? "") {
        case "show":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
        case "showCell":
            if tableView.dataSource === dbSource_Int {
                vc_CallBack.textDisplay = String(dbSource_Int.arr_Int[(selected?.row)!])
            } else {
                vc_CallBack.textDisplay = dbSource_String.arr_String[(selected?.row)!]
            }
            
        default: break
        }
        vc_CallBack.delegate = self
    }
}
