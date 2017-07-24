//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by Britton Baird on 7/24/17.
//  Copyright © 2017 Britton Baird. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Makes the button rounded
        disableButton.layer.cornerRadius = 10
        disableButton.clipsToBounds = true
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var disableButton: UIButton!
    
    @IBAction func disableButtonTapped() {
        
    }
    
    @IBAction func saveButtonTapped() {
        
    }
}
