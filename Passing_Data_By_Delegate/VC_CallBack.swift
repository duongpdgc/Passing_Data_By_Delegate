//
//  VC_CallBack.swift
//  Passing_Data_By_Delegate
//
//  Created by Admin on 1/8/18.
//  Copyright © 2018 DuongPham. All rights reserved.
//

import UIKit

class VC_CallBack: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var txtDisplay_Data_Source: UITextField!
    var textDisplay: String!
    var delegate: Delegate_DataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtDisplay_Data_Source.text = textDisplay
    }
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        if txtDisplay_Data_Source.text != "" {
            delegate?.passData(txtDisplay_Data_Source.text!)
            navigationController?.popViewController(animated: true)
        }
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
